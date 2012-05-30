module Refinery
  module Businesses
    module Admin
      class BusinessesController < ::Refinery::AdminController

        crudify :'refinery/businesses/business',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
