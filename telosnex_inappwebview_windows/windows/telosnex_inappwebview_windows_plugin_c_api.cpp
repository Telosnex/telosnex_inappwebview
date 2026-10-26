#include "include/telosnex_inappwebview_windows/telosnex_inappwebview_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "telosnex_inappwebview_windows_plugin.h"

void TelosnexInappwebviewWindowsPluginCApiRegisterWithRegistrar(
  FlutterDesktopPluginRegistrarRef registrar)
{
  telosnex_inappwebview_plugin::TelosnexInappwebviewWindowsPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarManager::GetInstance()
    ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
