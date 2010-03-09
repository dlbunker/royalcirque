class AddProductWebsiteColumn < ActiveRecord::Migration
  def self.up
    add_column :products, :website, :string
    add_column :products, :requires_shipping, :boolean
  end

  def self.down
  end
end
