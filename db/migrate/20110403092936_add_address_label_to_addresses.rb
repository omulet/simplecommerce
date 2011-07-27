class AddAddressLabelToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :address_label, :string
  end

  def self.down
    remove_column :addresses, :address_label
  end
end
