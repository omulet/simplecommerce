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
      :thumb=> "100x100#",
      :medium  => "150x150>" 
    }

end
