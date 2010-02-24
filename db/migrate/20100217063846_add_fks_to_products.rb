require 'migration_helpers'

class AddFksToProducts < ActiveRecord::Migration
  
  extend MigrationHelpers
  
  def self.up
    foreign_key :products, :product_type_id, :product_types
    foreign_key :products, :author_id, :authors
  end

  def self.down
  end
end
