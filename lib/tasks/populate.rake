require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    # Models => Listing, Business, Post, Page, Category
    time = Time.now
    endtime = time + 22.days
    images = Refinery::ImagePage.all

    [Refinery::Listings::Listing,Refinery::Businesses::Business].each(&:delete_all)

    Refinery::Listings::Listing.populate 30 do |listing|
    	listing.address 				=  Faker::Address.street_address
    	listing.city 						= 'Chicago'
    	listing.state 					= 'IL'
    	listing.neighborhood 		= ['Logan Square','Wicker Park','Brideport','Lakeview','Old Town','River North']
    	listing.price 					= [200000,300000,350000,400000,500000,600000,700000]
    	listing.mls_no 					= 100..900
    	listing.square_feet 		= 2000..8000
    	listing.bedrooms 				= 3..6
    	listing.bathrooms 			= 2..5
    	listing.open_house 			= time..endtime
    	listing.video_tour_url 	= '<iframe width="560" height="315" src="http://www.youtube.com/embed/W632IvwZ77o" frameborder="0" allowfullscreen></iframe>'
    	listing.tagged_features = ['Viking Pool','Granite Countertops','Heated Floors','Jacuzzi']
    	listing.photo_id 				= 1..10
    	listing.map 						= '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=chicago+il&amp;aq=&amp;sll=41.912806,-87.700649&amp;sspn=0.009229,0.014913&amp;ie=UTF8&amp;hq=&amp;hnear=Chicago,+Cook,+Illinois&amp;ll=41.878114,-87.629798&amp;spn=0.009235,0.014913&amp;t=m&amp;z=14&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=chicago+il&amp;aq=&amp;sll=41.912806,-87.700649&amp;sspn=0.009229,0.014913&amp;ie=UTF8&amp;hq=&amp;hnear=Chicago,+Cook,+Illinois&amp;ll=41.878114,-87.629798&amp;spn=0.009235,0.014913&amp;t=m&amp;z=14" style="color:#0000FF;text-align:left">View Larger Map</a></small>'
		end

		Refinery::Businesses::Business.populate 10 do |biz|
			biz.name = Faker::Company.name
			biz.website = Faker::Internet.domain_name
			biz.phone = '555-555-5555'
			biz.street = Faker::Address.street_address
			biz.city = Faker::Address.city
			biz.state = Faker::Address.state_abbr
			biz.area = ['Mission District', 'South Beach']
			biz.category = ['Restaurants and Bars', 'Home Inspection']
		end


		children = [
			'Lakeview',
			'South Beach',
			'Wicker Park',
			'Logan Square'
		]

		insert_page_with_children('Communities',children)

	end
end