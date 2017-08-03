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
    #honey pot check
     if contact_params[:member_name] && contact_params[:member_name] != ""
       return
     end

     flash[:notice] = 'Message sent successfully.'
     RoyalcirqueMailer.mail_royal_cirque(contact_params[:name], contact_params[:email], contact_params[:message]).deliver
     redirect_to :action => 'index'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :member_name)
  end
end
