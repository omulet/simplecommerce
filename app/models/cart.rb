class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items, :dependent => :destroy
  accepts_nested_attributes_for :cart_items
  
  
  validates_associated :cart_items, :on => :update

  def add_user user
    update_attribute :user_id, user.id
  end
  
  def add_item(product , q)
    existing_item = self.cart_items.find_by_product_id product
    if existing_item
      existing_item.update_attributes( :quantity => existing_item[:quantity] + q )
    else
      # pentru securitate, citim pretul direct din DB si nu il trimitem ca param din form
      prod = Product.find(product)
      self.cart_items.create( :product_id => product.id, :quantity => q, :price => prod.price )
    end
  end
  
  def remove_item( item )
    cart.cart_items.delete item
  end
  
  
  def subtotal
    cart_items.inject(0) { |sum, el| sum + el.quantity * el.price }
  end
  
  
end
