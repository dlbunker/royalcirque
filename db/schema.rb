# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100217063846) do

  create_table "authors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.text     "biography"
    t.binary   "picture",        :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "product_type_id"
    t.integer  "author_id"
    t.string   "title",            :limit => 50,                                     :default => ""
    t.string   "sku",                                                                :default => ""
    t.text     "description"
    t.decimal  "price",                                :precision => 8, :scale => 2, :default => 0.0
    t.binary   "picture",          :limit => 16777215
    t.binary   "thumb_picture",    :limit => 16777215
    t.binary   "featured_picture", :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["author_id"], :name => "index_products_on_author_id"
  add_index "products", ["product_type_id"], :name => "index_products_on_product_type_id"

end
