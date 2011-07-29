class CartsController < ApplicationController
  layout "no_sidebar"
  def add_to_cart
 	  product = Product.find(params[:product][:id])
    if current_user.nil?
    	redirect_to(:login, :notice => 'Login in.')
    	
	else
   		 @cart.add_item(product, params[:product][:quantity].to_i)  
   		 @cart.add_user(current_user)
    	 redirect_to products_url
    end
  end
  
  def remove_from_cart
    item = @cart.cart_items.find_by_product_id params[:id]
    item.destroy
    redirect_to products_url
  end
  
  # GET /carts/1
  # GET /carts/1.xml
  def show
    @cart = Cart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cart }
    end
  end

  def update
    cart = @cart
    respond_to do |format|
      if cart.update_attributes(params[:cart])
        format.html { redirect_to(:back, :notice => 'Cart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => cart.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  private
  def find_cart 
    session[:cart] ||= Cart.new

  end
  
  
end
