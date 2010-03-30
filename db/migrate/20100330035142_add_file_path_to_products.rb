class AddFilePathToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :file_path, :string
  end

  def self.down
  end
end
