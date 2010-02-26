class AddToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :pages, :string, :default => "" 
    add_column :products, :size, :string, :default => "" 
  end

  def self.down
  end
end
