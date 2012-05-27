module Refinery
  module Listings
    module Admin
      class ListingsController < ::Refinery::AdminController

        crudify :'refinery/listings/listing',
                :title_attribute => 'address', :xhr_paging => true

      end
    end
  end
end
