class Product < ActiveRecord::Base

  def self.random
    find(:first, :order => "RAND()")
  end

end
