# Subscriptions engine for Refinery CMS.

## About

__Simple Refinery's subscriptions engine allow users to subscribe to newsletter


## Installation

Include gem into your Gemfile:

    gem "refinerycms-subscriptions", '~> 0.0.1'

Inside your Refinery CMS application's root directory run:

    bundle install
    rails generate refinery:subscriptions
    rake db:migrate
    rake db:seed
    
## Customize view

To customize view override subscription form by running

    rake refinery:override view=refinery/subscriptions/shared/_subscription

## Attribution

Inspired by and modeled like RefineryCMS Inquiries engine

https://github.com/refinery/refinerycms-inquiries    
