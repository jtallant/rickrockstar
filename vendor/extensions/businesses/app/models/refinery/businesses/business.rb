module Refinery
  module Businesses
    class Business < Refinery::Core::BaseModel
      self.table_name = 'refinery_businesses'

      attr_accessible :name, :position, :website, :phone, :street, :city, :state, :area, :category, :photo_id

      acts_as_indexed :fields => [:name, :website, :phone, :street, :city, :state, :area, :category]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
