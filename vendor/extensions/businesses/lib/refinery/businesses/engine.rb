module Refinery
  module Businesses
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Businesses

      engine_name :refinery_businesses

      initializer "register refinerycms_businesses plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "businesses"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.businesses_admin_businesses_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/businesses/business',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Businesses)
      end
    end
  end
end
