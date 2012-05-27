module Refinery
  module Listings
    class ListingsController < ::ApplicationController

      before_filter :find_all_listings
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @listing in the line below:
        present(@page)
      end

      def show
        @listing = Listing.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @listing in the line below:
        present(@page)
      end

    protected

      def find_all_listings
        @listings = Listing.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/listings").first
      end

    end
  end
end
