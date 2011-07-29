class Product < ActiveRecord::Base
  attr_accessible :category_id, :name, :description, :quantity, :price, :photo
  belongs_to :category
  has_many :cart_items  
  accepts_nested_attributes_for :category
  
  
  has_attached_file :photo,
    :url => '/images/photos/:id/:style.:extension',
    :path => ':rails_root/public/images/photos/:id/:style.:extension',
    :default_url => '/images/photos/images.jpg',
    :styles => {
      :tiny => "42x42#",
      :thumb => "62x62#",
      :medium  => "128x100#",
      :large => "300x300>" 
    }

end
