class AddDescriptionToRefineryBusinesses < ActiveRecord::Migration
  def change
    add_column :refinery_businesses, :description, :text
  end
end
