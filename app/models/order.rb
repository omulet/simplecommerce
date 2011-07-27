class Order < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items

  
  validates_presence_of :address_id, :message => "Please select a delivery address"
  validates_presence_of :delivery_id, :message => "Please select a delivery method"


  def delivery_taxes
    if delivery_id.nil? 
      Delivery.first.delivery_fee
    else
      self.delivery.delivery_fee
    end
  end
  
end
