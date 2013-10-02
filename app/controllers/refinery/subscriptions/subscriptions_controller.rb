module Refinery
  module Subscriptions
    class SubscriptionsController < ::ApplicationController

      before_filter :find_page, :only => [:new, :create]

      def new
        @subscription = ::Refinery::Subscriptions::Subscription.new
      end

      def create
        @subscription = ::Refinery::Subscriptions::Subscription.new(params[:subscription])

        if @subscription.save
          begin
            ::Refinery::Subscriptions::SubscriptionMailer.notification(@subscription, request).deliver
          rescue
            logger.warn "There was an error delivering an subscription notification.\n#{$!}\n"
          end

          redirect_to refinery.thank_you_subscriptions_subscriptions_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/subscriptions").first
      end

    end
  end
end
