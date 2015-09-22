class CartController < ApplicationController
  layout "application"

  before_filter :redirect_to_ssl, :except => [:index]

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
    @total = 0

    coupon_code = params[:cart][:coupon]
    discount = Discount.find_by_code(coupon_code.upcase)

    if !coupon_code.nil? && coupon_code != "" && discount.nil?
      flash[:notice] = "Coupon Code is not valid.  Please enter a valid coupon code or checkout."
      index
      render :action => 'index'
    elsif !coupon_code.nil? && coupon_code != "" && !discount.active?
      flash[:notice] = "Coupon Code has expired.  Please enter a valid coupon code or checkout."
      index
      render :action => 'index'
    end

    flash[:notice] = nil
    session[:coupon] = discount

    session[:cart_item].each do |item|
      @total = @total + (item.quantity.to_i * item.product.price)
    end
  end

  def place_order
    @o = Order.find(params[:customer][:order_id])
    @o.status = "Complete"
    @o.save

    puts "@o.customer #{@o.customer}"

    RoyalcirqueMailer.order_received(@o.customer, @o).deliver

    session[:cart_item] = nil
    session[:coupon] = nil
    render :action => 'finished'
  end

  def review_order
    # see if customer already exists
    @cust = Customer.new
    @cust.first_name = params[:customer][:first_name]
    @cust.last_name = params[:customer][:last_name]
    @cust.email = params[:customer][:email]
    @cust.agree_to_receive_info = params[:customer][:agree_to_receive_info]
    existing_cust = Customer.find_by_first_name_and_last_name_and_email(@cust.first_name, @cust.last_name, @cust.email)

    if existing_cust.nil?
      @cust.save
    else
      @cust = existing_cust
    end

    # add a new order for the customer
    @order = Order.new
    @order.ship_name = params[:customer][:ship_name]
    @order.ship_street_1 = params[:customer][:ship_street_1]
    @order.ship_street_2 = params[:customer][:ship_street_2]
    @order.ship_city = params[:customer][:ship_city]
    @order.ship_state = params[:customer][:ship_state]
    @order.ship_zip = params[:customer][:ship_zip]
    @order.bill_name = params[:customer][:bill_name]
    @order.bill_street_1 = params[:customer][:bill_street_1]
    @order.bill_street_2 = params[:customer][:bill_street_2]
    @order.bill_city = params[:customer][:bill_city]
    @order.bill_state = params[:customer][:bill_state]
    @order.bill_zip = params[:customer][:bill_zip]
    @order.card_number = params[:customer][:card_number]
    @order.card_expire_date = params[:customer][:card_expire_date]
    @order.card_cvv2 = params[:customer][:card_cvv2]
    @order.status = "Pending"
    @order.subtotal = 0
    @order.discount = 0
    @order.tax = 0
    @order.total = 0
    @order.shipping_total = 0

    @cust.orders << @order
    @cust.save

    discount = session[:coupon]
    # add the order details
    session[:cart_item].each do |item|
      od = OrderDetail.new
      od.product = item.product
      od.quantity = item.quantity
      od.subtotal = item.product.price * od.quantity

      od.discount = 0
      if !discount.nil? && discount.product.id == od.product.id
        if discount.is_percentage
          od.discount = (item.product.price * (discount.discount/100)) * od.quantity
        else
          od.discount = (item.product.price - discount.discount) * od.quantity
        end
      end

      od.tax = 0 #no tax for out of state
      od.tax = (od.subtotal - od.discount) * 0.068 if (!@order.bill_state.nil? && @order.bill_state.downcase == "ut") || (!@order.bill_state.nil? && @order.bill_state.downcase == "utah")
      od.total = (od.subtotal - od.discount) + od.tax

      @order.subtotal = @order.subtotal + od.subtotal
      @order.discount = @order.discount + od.discount
      @order.tax = @order.tax + od.tax
      @order.total = @order.total + od.total

      @order.order_details << od
    end

    @order.save
  end

  private
    def redirect_to_ssl
      if request.ssl? || request.local?
        return true
      else
        redirect_to url_for params.merge({:protocol => 'https://', :host => 'royalcirque-mountaincirque.rhcloud.com'})
        return false
      end
    end
end
