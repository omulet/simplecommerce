class AddDescriptionToCategory < ActiveRecord::Migration
  def self.up
  	  t.string :description
  end

  def self.down
  	 remove_column :categories, :description
  end
end
