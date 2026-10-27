import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  // false: closing an InAppBrowser window must not quit the app. On CI the
  // main window can be off screen (the app is not foregrounded), so the
  // browser's window was the last visible one and the integration run ended.
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }

  // An exception AppKit catches (in a layout pass, on CI) is logged with its
  // reason, instead of a crash whose report does not say which one.
  override func applicationWillFinishLaunching(_ notification: Notification) {
    UserDefaults.standard.register(defaults: ["NSApplicationCrashOnExceptions": false])
    super.applicationWillFinishLaunching(notification)
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
