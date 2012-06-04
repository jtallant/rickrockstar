module Refinery
  module Listings
    class Listing < Refinery::Core::BaseModel
      self.table_name = 'refinery_listings'

      attr_accessible :address, :description, :position, :city, :state, :neighborhood, :video_tour_url, :tagged_features, :map, :photo, :mls_no, :price, :square_feet, :bedrooms, :bathrooms, :open_house, :photo_id

      acts_as_indexed :fields => [:address, :city, :state, :neighborhood, :video_tour_url, :tagged_features, :map]

      validates :address, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
