module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event', :xhr_paging => true, :order => "date DESC", :sortable => false

      end
    end
  end
end
