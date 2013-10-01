require 'spec_helper'

module Refinery
  module Subscriptions
    describe Subscription do
      describe "validations" do
        subject do
          FactoryGirl.create(:subscription,
          :email => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:email) { should == "Refinery CMS" }
      end
    end
  end
end
