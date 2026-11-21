#include <fcntl.h>
#include <unistd.h>

#include <cstdlib>

#include "my_application.h"

// `flutter test -d linux` drops the app's native stderr. That is where GLib
// warnings go, including the plugin's "WebProcess terminated (reason=...)",
// and WebKit's own processes inherit it. CI sets IAW_NATIVE_LOG to a file
// that keeps it.
static void KeepNativeStderr() {
  const char* path = std::getenv("IAW_NATIVE_LOG");
  if (path == nullptr || *path == '\0') return;
  int fd = open(path, O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0644);
  if (fd < 0) return;
  // dup2 clears close-on-exec, so WebKit's child processes write here too.
  dup2(fd, STDERR_FILENO);
  close(fd);
}

int main(int argc, char** argv) {
  KeepNativeStderr();
  g_autoptr(MyApplication) app = my_application_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
