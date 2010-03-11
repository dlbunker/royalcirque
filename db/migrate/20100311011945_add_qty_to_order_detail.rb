class AddQtyToOrderDetail < ActiveRecord::Migration
  def self.up
    add_column :order_details, :quantity, :integer
  end

  def self.down
  end
end
