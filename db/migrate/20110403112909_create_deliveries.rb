class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table :deliveries do |t|
      t.string :delivery_mode
      t.float :delivery_fee, :limit => 10, :default =>0.0, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :deliveries
  end
end
