# This migration comes from refinery_listings (originally 1)
class CreateListingsListings < ActiveRecord::Migration

  def up
    create_table :refinery_listings do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :neighborhood
      t.integer :price
      t.integer :mls_no
      t.integer :square_feet
      t.integer :bedrooms
      t.integer :bathrooms
      t.datetime :open_house
      t.string :video_tour_url
      t.string :tagged_features
      t.integer :photo_id
      t.string :map
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-listings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/listings/listings"})
    end

    drop_table :refinery_listings

  end

end
