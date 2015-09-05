class ProductsController < ApplicationController
  layout "application"

  def index
    @products = Product.page(params[:page]).per(20).order('id')
  end

  def detail
    @product = Product.find(params[:id])
  end

	def get_thumb_image
	  prod = Product.find(params[:id])
		send_data(prod.thumb_picture, :filename => 'thumb-image.jpg', :type => 'image/jpeg', :disposition => 'inline')
	end

	def get_picture_image
	  prod = Product.find(params[:id])
		send_data(prod.picture, :filename => 'product-image.jpg', :type => 'image/jpeg', :disposition => 'inline')
	end

  def download
	  prod = Product.find(params[:id])
    send_file prod.file_path, :type => prod.mime_type
  end
end
