#ifndef TELOSNEX_INAPPWEBVIEW_PLUGIN_PLUGIN_SCRIPT_H_
#define TELOSNEX_INAPPWEBVIEW_PLUGIN_PLUGIN_SCRIPT_H_

#include "user_script.h"

namespace telosnex_inappwebview_plugin
{
  class PluginScript : public UserScript
  {
  public:

    PluginScript(
      const std::optional<std::string>& groupName,
      const std::string& source,
      const UserScriptInjectionTime& injectionTime,
      const bool& forMainFrameOnly,
      const std::optional<std::vector<std::string>>& allowedOriginRules,
      std::shared_ptr<ContentWorld> contentWorld,
      const bool& requiredInAllContentWorlds
    );
    ~PluginScript();

    bool isRequiredInAllContentWorlds() const
    {
      return requiredInAllContentWorlds_;
    }

    std::shared_ptr<PluginScript> copyAndSet(const std::shared_ptr<ContentWorld> cw) const;

  private:
    bool requiredInAllContentWorlds_;
  };
}
#endif //TELOSNEX_INAPPWEBVIEW_PLUGIN_PLUGIN_SCRIPT_H_