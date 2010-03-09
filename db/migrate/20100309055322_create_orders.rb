require 'migration_helpers'

class CreateOrders < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    create_table :orders do |t|
      t.references :customer
      t.string :bill_name 
      t.string :bill_street_1 
      t.string :bill_street_2 
      t.string :bill_city
      t.string :bill_state
      t.string :bill_zip
      t.string :ship_name 
      t.string :ship_street_1 
      t.string :ship_street_2 
      t.string :ship_city
      t.string :ship_state
      t.string :ship_zip
      t.string :status

      t.string :card_number
      t.string :card_cvv2
      t.string :card_expire_date

      t.decimal :subtotal, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :shipping_total, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :tax, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :discount, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :total, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end

    add_index :orders, :customer_id

    foreign_key :orders, :customer_id, :customers

    create_table :order_details do |t|
      t.references :order
      t.references :product

      t.decimal :subtotal, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :tax, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :discount, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :total, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end

    add_index :order_details, :order_id
    add_index :order_details, :product_id

    foreign_key :order_details, :order_id, :orders
    foreign_key :order_details, :product_id, :products
  end

  def self.down
    drop_table :orders
  end
end
