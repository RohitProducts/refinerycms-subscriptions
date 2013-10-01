module Refinery
  module Subscriptions
    class Subscription < Refinery::Core::BaseModel
      self.table_name = 'refinery_subscriptions'

      attr_accessible :email, :position

      acts_as_indexed :fields => [:email]

      validates :email, :presence => true, :uniqueness => true
    end
  end
end
