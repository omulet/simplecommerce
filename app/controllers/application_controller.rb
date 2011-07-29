class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :current_cart, :get_categories
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def current_cart
    session[:cart_id] ||= nil
    unless session[:cart_id].nil?
      cart = Cart.find_by_id(session[:cart_id])
    else
      cart = Cart.create :user => current_user
      session[:cart_id] = cart.id
    end
    @cart = cart
  end
  
  def get_categories
    @product_categories = Category.find(:all, :order => 'description')
  end
end