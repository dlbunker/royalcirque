class AddMimeTypeToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :mime_type, :string
  end

  def self.down
  end
end
