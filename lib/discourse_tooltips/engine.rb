module ::DiscourseSSOAuto
  PLUGIN_NAME = "discourse-sso-auto"

  class Engine < ::Rails::Engine
    engine_name DiscourseSSUAuto::PLUGIN_NAME
    isolate_namespace DiscourseSSOAuto
  end
end
