# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Listings" do
    describe "Admin" do
      describe "listings" do
        login_refinery_user

        describe "listings list" do
          before(:each) do
            FactoryGirl.create(:listing, :address => "UniqueTitleOne")
            FactoryGirl.create(:listing, :address => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.listings_admin_listings_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.listings_admin_listings_path

            click_link "Add New Listing"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Address", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Listings::Listing.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Address can't be blank")
              Refinery::Listings::Listing.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:listing, :address => "UniqueTitle") }

            it "should fail" do
              visit refinery.listings_admin_listings_path

              click_link "Add New Listing"

              fill_in "Address", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Listings::Listing.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:listing, :address => "A address") }

          it "should succeed" do
            visit refinery.listings_admin_listings_path

            within ".actions" do
              click_link "Edit this listing"
            end

            fill_in "Address", :with => "A different address"
            click_button "Save"

            page.should have_content("'A different address' was successfully updated.")
            page.should have_no_content("A address")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:listing, :address => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.listings_admin_listings_path

            click_link "Remove this listing forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Listings::Listing.count.should == 0
          end
        end

      end
    end
  end
end
