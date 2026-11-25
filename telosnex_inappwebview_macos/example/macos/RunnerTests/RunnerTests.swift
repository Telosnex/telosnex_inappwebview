import Cocoa
import FlutterMacOS
import XCTest

@testable import telosnex_inappwebview_macos

/// A headless webview is put in a zero-size wrapper NSView, and the wrapper is
/// added to the main window's content view (`HeadlessInAppWebView.prepare`).
/// When the headless webview is disposed of, the wrapper must leave the
/// content view too. Upstream commit acb20fc10 (2023-11-14, "fix #1837")
/// stopped removing it, so every headless webview leaves one empty NSView in
/// the window for the life of the app.
class HeadlessInAppWebViewWrapperTests: XCTestCase {
  private var plugin: TelosnexInAppWebViewPlugin!
  private var contentView: NSView!

  override func setUpWithError() throws {
    let windows = NSApplication.shared.windows
    guard
      let window = windows.first(where: { $0.contentViewController is FlutterViewController }),
      let flutterViewController = window.contentViewController as? FlutterViewController,
      let view = window.contentView
    else {
      throw TestSetupError("The test host has no window with a FlutterViewController.")
    }
    contentView = view

    // prepare() adds the wrapper to NSApplication.shared.mainWindow, which is
    // nil while the app is not active. The test host is often in the
    // background, so make the Flutter window the main window explicitly.
    MainWindowOverride.install()
    MainWindowOverride.window = window
    guard NSApplication.shared.mainWindow === window else {
      throw TestSetupError("Could not make the Flutter window the main window.")
    }

    let registrar = flutterViewController.registrar(
      forPlugin: "HeadlessInAppWebViewWrapperTests")
    plugin = TelosnexInAppWebViewPlugin(with: registrar)
  }

  override func tearDown() {
    MainWindowOverride.window = nil
    plugin?.detachFromEngine(for: plugin.registrar)
    plugin = nil
    contentView = nil
  }

  private func runHeadless(id: String) throws -> HeadlessInAppWebView {
    let manager = try XCTUnwrap(plugin.headlessInAppWebViewManager)
    manager.run(id: id, params: ["initialSettings": [String: Any?]()])
    return try XCTUnwrap(manager.webViews[id] ?? nil)
  }

  func testRunAddsOneWrapperToTheMainWindow() throws {
    let before = contentView.subviews.count

    let headless = try runHeadless(id: "wrapper-precondition")
    XCTAssertEqual(contentView.subviews.count, before + 1)

    headless.dispose()
  }

  func testDisposeRemovesTheWrapperFromTheMainWindow() throws {
    let before = contentView.subviews.count

    for i in 0..<3 {
      let headless = try runHeadless(id: "wrapper-dispose-\(i)")
      headless.dispose()
    }

    XCTAssertEqual(
      contentView.subviews.count, before,
      "Each disposed headless webview left its wrapper NSView in the main window.")
  }

  func testDisposeAndGetFlutterWebViewRemovesTheWrapperFromTheMainWindow() throws {
    let before = contentView.subviews.count

    let headless = try runHeadless(id: "wrapper-convert")
    let flutterWebView = try XCTUnwrap(headless.disposeAndGetFlutterWebView(withFrame: .zero))

    XCTAssertNil(flutterWebView.superview)
    XCTAssertEqual(
      contentView.subviews.count, before,
      "Converting a headless webview to a widget left its wrapper NSView in the main window.")

    flutterWebView.dispose(removeFromSuperview: true)
  }
  // MARK: - Memory release and dealloc logging

  /// Weak references to the objects behind one headless webview.
  private struct WeakGraph {
    weak var headless: HeadlessInAppWebView?
    weak var flutterWebView: FlutterWebViewController?
    weak var webView: InAppWebView?
    weak var webViewChannelDelegate: WebViewChannelDelegate?
    weak var findInteractionController: FindInteractionController?

    var alive: [String] {
      var names: [String] = []
      if headless != nil { names.append("HeadlessInAppWebView") }
      if flutterWebView != nil { names.append("FlutterWebViewController") }
      if webView != nil { names.append("InAppWebView") }
      if webViewChannelDelegate != nil { names.append("WebViewChannelDelegate") }
      if findInteractionController != nil { names.append("FindInteractionController") }
      return names
    }
  }

  /// Runs and disposes of one headless webview. Returns weak references to
  /// its objects. All strong references made here end with the autorelease
  /// pool.
  private func runAndDisposeHeadless(id: String) throws -> WeakGraph {
    var graph = WeakGraph()
    try autoreleasepool {
      let headless = try runHeadless(id: id)
      let flutterWebView = try XCTUnwrap(headless.flutterWebView)
      let webView = try XCTUnwrap(flutterWebView.webView())
      graph.headless = headless
      graph.flutterWebView = flutterWebView
      graph.webView = webView
      graph.webViewChannelDelegate = try XCTUnwrap(webView.channelDelegate)
      graph.findInteractionController = try XCTUnwrap(webView.findInteractionController)

      headless.dispose()
    }
    return graph
  }

  /// Lets WebKit and AppKit finish work queued on the main run loop.
  private func spinMainRunLoop(seconds: TimeInterval) {
    RunLoop.current.run(until: Date().addingTimeInterval(seconds))
  }

  func testDisposeReleasesTheWebViewObjects() throws {
    let graph = try runAndDisposeHeadless(id: "release")

    if !graph.alive.isEmpty {
      // WebKit can keep a WKWebView until queued main-thread work runs.
      spinMainRunLoop(seconds: 0.5)
    }

    XCTAssertEqual(
      graph.alive, [],
      "These objects are still alive after HeadlessInAppWebView.dispose().")
  }

  /// Under `flutter run`, the app's stdout and stderr are pipes, and stdio
  /// fully buffers stdout in 16 KiB blocks. Dealloc messages written there
  /// appear about 99 webviews late, all at once, and look like a bulk release.
  /// The dealloc message must be readable as soon as the object is released.
  func testDeallocLogIsWrittenWhenTheObjectIsReleased() throws {
    let stdoutCapture = try OutputCapture(fd: STDOUT_FILENO, stream: stdout)
    defer { stdoutCapture.stop() }
    let stderrCapture = try OutputCapture(fd: STDERR_FILENO, stream: stderr)
    defer { stderrCapture.stop() }

    let graph = try runAndDisposeHeadless(id: "dealloc-log")
    XCTAssertEqual(graph.alive, [], "Precondition: the objects were released.")

    let written = stdoutCapture.readAvailable() + stderrCapture.readAvailable()
    XCTAssertTrue(
      written.contains("HeadlessInAppWebView - dealloc"),
      "The dealloc message was not written when the object was released. "
        + "Bytes readable from stdout and stderr: \(written.utf8.count).")
  }
}

/// Sends a file descriptor to a pipe and reads what has reached it, without
/// flushing stdio.
///
/// Under `flutter run`, the app's stdout and stderr are pipes: stdio fully
/// buffers stdout in 16 KiB blocks and does not buffer stderr. Under
/// `xcodebuild`, they are terminals and Xcode makes stdout unbuffered. stdio
/// picks the mode when a stream is first used, so changing the descriptor
/// alone does not change it. This class sets the `flutter run` mode
/// explicitly and restores the original mode when it stops.
private final class OutputCapture {
  private static let lineBuffered: Int16 = 0x0001  // __SLBF
  private static let unbuffered: Int16 = 0x0002  // __SNBF
  private static let pipeBufferSize = 16 * 1024

  private let fd: Int32
  private let stream: UnsafeMutablePointer<FILE>
  private let savedFd: Int32
  private let readEnd: Int32
  private let savedMode: Int32
  private var stopped = false

  init(fd: Int32, stream: UnsafeMutablePointer<FILE>) throws {
    self.fd = fd
    self.stream = stream
    // Write out anything from earlier tests so that it is not captured.
    fflush(stream)
    var fds: [Int32] = [0, 0]
    guard pipe(&fds) == 0 else { throw TestSetupError("pipe() failed: \(errno)") }
    readEnd = fds[0]
    _ = fcntl(readEnd, F_SETFL, fcntl(readEnd, F_GETFL) | O_NONBLOCK)
    savedFd = dup(fd)
    dup2(fds[1], fd)
    close(fds[1])

    let flags = stream.pointee._flags
    savedMode =
      flags & Self.unbuffered != 0
      ? _IONBF : flags & Self.lineBuffered != 0 ? _IOLBF : _IOFBF
    if fd == STDERR_FILENO {
      setvbuf(stream, nil, _IONBF, 0)
    } else {
      setvbuf(stream, nil, _IOFBF, Self.pipeBufferSize)
    }
  }

  func readAvailable() -> String {
    var data = Data()
    var buffer = [UInt8](repeating: 0, count: 4096)
    while true {
      let count = read(readEnd, &buffer, buffer.count)
      if count <= 0 { break }
      data.append(contentsOf: buffer[0..<count])
    }
    return String(decoding: data, as: UTF8.self)
  }

  func stop() {
    guard !stopped else { return }
    stopped = true
    // Restore the descriptor first. Then the flush sends text that was still
    // buffered to the real output, not to the pipe.
    dup2(savedFd, fd)
    close(savedFd)
    fflush(stream)
    setvbuf(stream, nil, savedMode, savedMode == _IONBF ? 0 : Self.pipeBufferSize)
    close(readEnd)
  }
}

private struct TestSetupError: Error, CustomStringConvertible {
  let description: String
  init(_ description: String) { self.description = description }
}

/// Replaces the getter of NSApplication.mainWindow so that a test can choose
/// the main window without the app being active.
private enum MainWindowOverride {
  static var window: NSWindow?
  private static var installed = false

  static func install() {
    guard !installed else { return }
    let cls: AnyClass = NSApplication.self
    guard
      let original = class_getInstanceMethod(cls, #selector(getter: NSApplication.mainWindow)),
      let replacement = class_getInstanceMethod(
        cls, #selector(getter: NSApplication.testOverride_mainWindow))
    else { return }
    method_exchangeImplementations(original, replacement)
    installed = true
  }
}

extension NSApplication {
  /// After MainWindowOverride.install(), this is the implementation of
  /// `mainWindow`, and calling `testOverride_mainWindow` calls the original.
  @objc dynamic fileprivate var testOverride_mainWindow: NSWindow? {
    MainWindowOverride.window ?? self.testOverride_mainWindow
  }
}
