class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :contact_firstname
      t.string :contact_lastname
      t.string :address1
      t.string :address2
      t.string :zip_code
      t.string :state
      t.string :country
      t.string :phone
      t.string :instructions

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
