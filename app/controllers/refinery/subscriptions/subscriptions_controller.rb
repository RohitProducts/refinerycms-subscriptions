module Refinery
  module Subscriptions
    class SubscriptionsController < ::ApplicationController

      before_filter :find_all_subscriptions
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subscription in the line below:
        present(@page)
      end

      def show
        @subscription = Subscription.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subscription in the line below:
        present(@page)
      end

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
        else
          render :action => 'new'
        end
      end

    protected

      def find_all_subscriptions
        @subscriptions = Subscription.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/subscriptions").first
      end

    end
  end
end