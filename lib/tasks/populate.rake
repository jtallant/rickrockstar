namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    # Models => Listing, Business, Post, Page, Category
    time = Time.now
    endtime = time + 22.days
    images = Refinery::ImagePage.all

    [Refinery::Listings::Listing].each(&:delete_all)

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
	end
end



    # [Category, Product, Person].each(&:delete_all)

    # Category.populate 20 do |category|
    #   category.name = Populator.words(1..3).titleize
    #   Product.populate 10..100 do |product|
    #     product.category_id = category.id
    #     product.name = Populator.words(1..5).titleize
    #     product.description = Populator.sentences(2..10)
    #     product.price = [4.99, 19.95, 100]
    #     product.created_at = 2.years.ago..Time.now
    #   end
    # end

    # Person.populate 100 do |person|
    #   person.name    = Faker::Name.name
    #   person.company = Faker::Company.name
    #   person.email   = Faker::Internet.email
    #   person.phone   = Faker::PhoneNumber.phone_number
    #   person.street  = Faker::Address.street_address
    #   person.city    = Faker::Address.city
    #   person.state   = Faker::Address.us_state_abbr
    #   person.zip     = Faker::Address.zip_code
    # end
  # end
# end