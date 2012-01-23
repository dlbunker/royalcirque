class AddSubtitleToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :subtitle, :string
  end

  def self.down
  end
end
