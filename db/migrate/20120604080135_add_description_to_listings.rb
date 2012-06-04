class AddDescriptionToListings < ActiveRecord::Migration
  def change
    add_column :refinery_listings, :description, :text
  end
end
