class ChangeListingMapField < ActiveRecord::Migration
	def change
		change_column :refinery_listings, :map, :text
	end
end
