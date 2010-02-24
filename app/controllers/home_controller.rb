class HomeController < ApplicationController
  layout "application"
  
  def index
    @product = Product.random
  end
  
	def get_featured_image
	  prod = Product.find(params[:id])
		send_data(prod.featured_picture, :filename => 'featured-image.jpg', :type => 'image/jpeg', :disposition => 'inline')
	end

  def send_mail
     flash[:notice] = 'Message sent successfully.'
     RoyalcirqueMailer::deliver_mail(params[:contact][:name], params[:contact][:email], params[:contact][:message])
     redirect_to :action => 'index'
  end
end
