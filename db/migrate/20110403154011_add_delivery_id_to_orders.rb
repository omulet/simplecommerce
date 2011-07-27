class AddDeliveryIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :delivery_id, :integer
  end

  def self.down
    remove_column :orders, :delivery_id
  end
end
