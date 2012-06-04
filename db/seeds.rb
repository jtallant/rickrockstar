# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed

# Added by Refinery CMS Listings extension
Refinery::Listings::Engine.load_seed

# Home About Blog Contact Listings
# ['Buyers','Communities','Sellers','Property Search','Business Directory'].each do |page|
# 	Refinery::Page.find_or_create_by_title(page)
# end


# Create all communities and a child page of homes for each one
# ['Redding', 'Anderson', 'Cottonwood', 'Shasta Lake City', 'Palo Cedro', 'Lakehead', 'Lake California'].each do |page|
# 	x = Refinery::Page.find_by_title(page)
# 	x.parent_id = 11
# 	x.save
# end
# Added by Refinery CMS Businesses extension
Refinery::Businesses::Engine.load_seed

# Added by Refinery CMS Events extension
Refinery::Events::Engine.load_seed
