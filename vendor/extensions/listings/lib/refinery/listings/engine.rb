module Refinery
  module Listings
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Listings

      engine_name :refinery_listings

      initializer "register refinerycms_listings plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "listings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.listings_admin_listings_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/listings/listing',
            :title => 'address'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Listings)
      end
    end
  end
end
