module Refinery
  module Subscriptions
    class Setting

      class << self

        def notification_recipients
          Refinery::Setting.find_or_set(:subscription_notification_recipients,
                                        ((Refinery::Role[:refinery].users.first.email rescue nil) if defined?(Refinery::Role)).to_s,
                                        :scoping => "subscriptions")
        end

        def notification_subject
          Refinery::Setting.find_or_set(:subscription_notification_subject,
                                        "New subscription to your newsletter",
                                        :scoping => "subscriptions")
        end
      end
    end
  end
end