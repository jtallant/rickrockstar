
FactoryGirl.define do
  factory :listing, :class => Refinery::Listings::Listing do
    sequence(:address) { |n| "refinery#{n}" }
  end
end

