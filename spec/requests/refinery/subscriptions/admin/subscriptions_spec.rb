# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Subscriptions" do
    describe "Admin" do
      describe "subscriptions" do
        login_refinery_user

        describe "subscriptions list" do
          before do
            FactoryGirl.create(:subscription, :email => "UniqueTitleOne")
            FactoryGirl.create(:subscription, :email => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.subscriptions_admin_subscriptions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.subscriptions_admin_subscriptions_path

            click_link "Add New Subscription"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Email", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Subscriptions::Subscription.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Email can't be blank")
              Refinery::Subscriptions::Subscription.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:subscription, :email => "UniqueTitle") }

            it "should fail" do
              visit refinery.subscriptions_admin_subscriptions_path

              click_link "Add New Subscription"

              fill_in "Email", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Subscriptions::Subscription.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:subscription, :email => "A email") }

          it "should succeed" do
            visit refinery.subscriptions_admin_subscriptions_path

            within ".actions" do
              click_link "Edit this subscription"
            end

            fill_in "Email", :with => "A different email"
            click_button "Save"

            page.should have_content("'A different email' was successfully updated.")
            page.should have_no_content("A email")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:subscription, :email => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.subscriptions_admin_subscriptions_path

            click_link "Remove this subscription forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Subscriptions::Subscription.count.should == 0
          end
        end

      end
    end
  end
end
