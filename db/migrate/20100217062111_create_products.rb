class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :product_type
      t.references :author
      t.string :title, :limit => 50, :default => "" 
      t.string :sku, :default => "" 
      t.text :description, :default => "" 
      t.decimal :price, :precision => 8, :scale => 2, :default => 0.0
    	t.binary :picture, :limit => 2.megabytes
    	t.binary :thumb_picture, :limit => 1.megabytes
    	t.binary :featured_picture, :limit => 1.megabytes

      t.timestamps
    end

    add_index :products, :product_type_id
    add_index :products, :author_id
  end

  def self.down
    drop_table :products
  end
end
