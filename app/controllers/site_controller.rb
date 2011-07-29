class SiteController < ApplicationController
  
  def index
    @top_vanzari = Product.find(:all)
    @reduceri = Product.find(:all)
  end
end
