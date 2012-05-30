
FactoryGirl.define do
  factory :business, :class => Refinery::Businesses::Business do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

