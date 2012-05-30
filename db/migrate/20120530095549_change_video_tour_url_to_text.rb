class ChangeVideoTourUrlToText < ActiveRecord::Migration
	change_column :refinery_listings, :video_tour_url, :text
end
