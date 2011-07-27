class AddProductIdToCategory < ActiveRecord::Migration
  def self.up
  	  t.string :product_id
  end

  def self.down
  	 remove_column :categories, :product_id
  end
end
