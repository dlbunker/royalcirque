class CartController < ApplicationController
  layout "application"
  
  def index
    @cart_items = nil
    
    if !session[:cart_item].nil? 
      @cart_items = session[:cart_item]
    end
  end
  
  def add_to_cart
    session[:cart_item] = Array.new if session[:cart_item].nil?
    
    # See if this product already exists and add qty to it if it does, otherwise add it
    exists = false
    
    session[:cart_item].each do |item|
      if item.product.id.to_s == params[:cart][:product_id]
        item.quantity = item.quantity.to_i + params[:cart][:qty].to_i
        exists = true
        break
      end
    end
    
    logger.debug "Product already exists: #{exists}"
    
    if !exists
      cart_item = CartItem.new
      cart_item.product = Product.find(params[:cart][:product_id])
      cart_item.quantity = params[:cart][:qty]
      session[:cart_item] << cart_item
    end
    
    redirect_to :controller => 'cart', :action => 'index'
  end

  def checkout
  end
end
