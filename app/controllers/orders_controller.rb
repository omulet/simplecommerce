class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
    layout "no_sidebar"
   
  
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end
  
   def assign_items(order)    	
	  	 @cart.cart_items.each do |item|  	 	
	    	     item.order_id = order.id
	       		 item.cart = nil
	       		 session[:cart] = nil	       		 
	       		 item.save
	       end		
	end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
      		
		@order = Order.new
	   	@addresses = current_user.addresses.all
	   	@checked_address = params[:address_id].present? ? params[:address_id] : @addresses.first.id

		@deliveries = Delivery.find(:all)
		#@payments = Payment.find(:all)			    
		@checked_delivery = params[:delivery_id].present? ? params[:delivery_id] : @deliveries.first.id
		#@checked_payment = params[:payment_id].present? ? params[:payment_id] : @payments.last.id    
		if (params[:delivery_id].present?)
		      @delivery_fee = @deliveries[params[:delivery_id]].delivery_fee
		else
		      @delivery_fee=0
		end
		
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
  
    @order = current_user.orders.build(params[:order])     	
	assign_items(@order)

    respond_to do |format|
      if @order.save
        format.html { redirect_to(:products, :notice => 'Order was successfully created.') }        
        format.xml  { render :xml => @order, :status => :created, :location => @order } 
        @cart.cart_items.destroy_all     	
      else
        format.html { redirect_to :back, :error => 'Error saving order' }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
