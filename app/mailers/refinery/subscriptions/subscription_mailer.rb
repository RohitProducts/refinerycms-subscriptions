module Refinery
  module Subscriptions
    class SubscriptionMailer < ActionMailer::Base

      def notification(subscription, request)
        @subscription = subscription
        mail  :subject => Refinery::Subscriptions::Setting.notification_subject,
              :to => Refinery::Subscriptions::Setting.notification_recipients,
              :from => ::I18n.t('from_name',
                                :scope => 'refinery.subscriptions.config',
                                :site_name => Refinery::Core.site_name) + "@#{request.domain}",
              :reply_to => @subscription.email
      end
    end
  end
end