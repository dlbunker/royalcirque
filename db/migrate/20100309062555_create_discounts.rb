require 'migration_helpers'

class CreateDiscounts < ActiveRecord::Migration
  extend MigrationHelpers
  def self.up
    create_table :discounts do |t|
      t.references :product
      t.string :code 
      t.boolean :is_percentage 
      t.boolean :active, :default => true
      t.decimal :discount, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end

    add_index :discounts, :product_id

    foreign_key :discounts, :product_id, :products

    create_table :order_discounts, :id => false do |t|
      t.references :order
      t.references :discount
    end

    add_index :order_discounts, :order_id
    add_index :order_discounts, :discount_id

    foreign_key :order_discounts, :order_id, :orders
    foreign_key :order_discounts, :discount_id, :discounts
  end

  def self.down
    drop_table :discounts
  end
end
