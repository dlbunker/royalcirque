class Product < ActiveRecord::Base
  belongs_to :author
  belongs_to :product_type

  def self.random
    order("RAND()").first
    # find(:first, :order => "RAND()")
  end

end
