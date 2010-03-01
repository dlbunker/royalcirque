class CartController < ApplicationController
  layout "application"
  
  def add_to_cart
    
    redirect_to :controller => 'cart', :action => 'index'
  end
end
