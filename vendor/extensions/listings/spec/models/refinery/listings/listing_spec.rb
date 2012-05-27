require 'spec_helper'

module Refinery
  module Listings
    describe Listing do
      describe "validations" do
        subject do
          FactoryGirl.create(:listing,
          :address => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:address) { should == "Refinery CMS" }
      end
    end
  end
end
