
FactoryGirl.define do
  factory :subscription, :class => Refinery::Subscriptions::Subscription do
    sequence(:email) { |n| "refinery#{n}" }
  end
end

