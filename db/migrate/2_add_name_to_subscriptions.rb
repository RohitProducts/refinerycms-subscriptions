class AddNameToSubscriptions < ActiveRecord::Migration

  def change
    add_column :refinery_subscriptions, :first_name, :string
    add_column :refinery_subscriptions, :last_name, :string
  end

end