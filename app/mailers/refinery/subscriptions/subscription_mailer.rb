module Refinery
  module Subscriptions
    class SubscriptionMailer < ActionMailer::Base

      def notification(subscription, request)
        @subscription = subscription
        mail  :subject => Refinery::Subscriptions::Setting.notification_subject,
              :to => Refinery::Subscriptions::Setting.notification_recipients,
              :from => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
              :reply_to => @subscription.email
      end
    end
  end
end