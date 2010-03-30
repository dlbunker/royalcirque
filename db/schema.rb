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

ActiveRecord::Schema.define(:version => 20100330041222) do

  create_table "authors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.text     "biography"
    t.binary   "picture",        :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "agree_to_receive_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discounts", :force => true do |t|
    t.integer  "product_id"
    t.string   "code"
    t.boolean  "is_percentage"
    t.boolean  "active",                                      :default => true
    t.decimal  "discount",      :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discounts", ["product_id"], :name => "index_discounts_on_product_id"

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "subtotal",   :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "tax",        :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "discount",   :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "total",      :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  add_index "order_details", ["order_id"], :name => "index_order_details_on_order_id"
  add_index "order_details", ["product_id"], :name => "index_order_details_on_product_id"

  create_table "order_discounts", :id => false, :force => true do |t|
    t.integer "order_id"
    t.integer "discount_id"
  end

  add_index "order_discounts", ["discount_id"], :name => "index_order_discounts_on_discount_id"
  add_index "order_discounts", ["order_id"], :name => "index_order_discounts_on_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.string   "bill_name"
    t.string   "bill_street_1"
    t.string   "bill_street_2"
    t.string   "bill_city"
    t.string   "bill_state"
    t.string   "bill_zip"
    t.string   "ship_name"
    t.string   "ship_street_1"
    t.string   "ship_street_2"
    t.string   "ship_city"
    t.string   "ship_state"
    t.string   "ship_zip"
    t.string   "status"
    t.string   "card_number"
    t.string   "card_cvv2"
    t.string   "card_expire_date"
    t.decimal  "subtotal",         :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "shipping_total",   :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "tax",              :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "discount",         :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "total",            :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "product_type_id"
    t.integer  "author_id"
    t.string   "title",             :limit => 50,                                     :default => ""
    t.string   "sku",                                                                 :default => ""
    t.text     "description"
    t.decimal  "price",                                 :precision => 8, :scale => 2, :default => 0.0
    t.binary   "picture",           :limit => 16777215
    t.binary   "thumb_picture",     :limit => 16777215
    t.binary   "featured_picture",  :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pages",                                                               :default => ""
    t.string   "size",                                                                :default => ""
    t.string   "website"
    t.boolean  "requires_shipping"
    t.string   "file_path"
    t.string   "mime_type"
  end

  add_index "products", ["author_id"], :name => "index_products_on_author_id"
  add_index "products", ["product_type_id"], :name => "index_products_on_product_type_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id",                       :null => false
    t.text     "data",       :limit => 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
