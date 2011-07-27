class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order


  def increment_quantity
    @quantity += 1
  end

  def total_price
    quantity * price
  end
  
	def add_order order
     	self.update_attribute :order_id, order.id
   end

end
