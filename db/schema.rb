# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20120123224533) do

  create_table "authors", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "middle_initial", limit: 255
    t.text     "biography",      limit: 65535
    t.binary   "picture",        limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",            limit: 255
    t.string   "last_name",             limit: 255
    t.string   "email",                 limit: 255
    t.boolean  "agree_to_receive_info", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discounts", force: :cascade do |t|
    t.integer  "product_id",    limit: 4
    t.string   "code",          limit: 255
    t.boolean  "is_percentage", limit: 1
    t.boolean  "active",        limit: 1,                           default: true
    t.decimal  "discount",                  precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discounts", ["product_id"], name: "index_discounts_on_product_id", using: :btree

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.decimal  "subtotal",             precision: 8, scale: 2, default: 0.0
    t.decimal  "tax",                  precision: 8, scale: 2, default: 0.0
    t.decimal  "discount",             precision: 8, scale: 2, default: 0.0
    t.decimal  "total",                precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   limit: 4
  end

  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree
  add_index "order_details", ["product_id"], name: "index_order_details_on_product_id", using: :btree

  create_table "order_discounts", id: false, force: :cascade do |t|
    t.integer "order_id",    limit: 4
    t.integer "discount_id", limit: 4
  end

  add_index "order_discounts", ["discount_id"], name: "index_order_discounts_on_discount_id", using: :btree
  add_index "order_discounts", ["order_id"], name: "index_order_discounts_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",      limit: 4
    t.string   "bill_name",        limit: 255
    t.string   "bill_street_1",    limit: 255
    t.string   "bill_street_2",    limit: 255
    t.string   "bill_city",        limit: 255
    t.string   "bill_state",       limit: 255
    t.string   "bill_zip",         limit: 255
    t.string   "ship_name",        limit: 255
    t.string   "ship_street_1",    limit: 255
    t.string   "ship_street_2",    limit: 255
    t.string   "ship_city",        limit: 255
    t.string   "ship_state",       limit: 255
    t.string   "ship_zip",         limit: 255
    t.string   "status",           limit: 255
    t.string   "card_number",      limit: 255
    t.string   "card_cvv2",        limit: 255
    t.string   "card_expire_date", limit: 255
    t.decimal  "subtotal",                     precision: 8, scale: 2, default: 0.0
    t.decimal  "shipping_total",               precision: 8, scale: 2, default: 0.0
    t.decimal  "tax",                          precision: 8, scale: 2, default: 0.0
    t.decimal  "discount",                     precision: 8, scale: 2, default: 0.0
    t.decimal  "total",                        precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "product_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_type_id",   limit: 4
    t.integer  "author_id",         limit: 4
    t.string   "title",             limit: 50,                               default: ""
    t.string   "sku",               limit: 255,                              default: ""
    t.text     "description",       limit: 65535
    t.decimal  "price",                              precision: 8, scale: 2, default: 0.0
    t.binary   "picture",           limit: 16777215
    t.binary   "thumb_picture",     limit: 16777215
    t.binary   "featured_picture",  limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pages",             limit: 255,                              default: ""
    t.string   "size",              limit: 255,                              default: ""
    t.string   "website",           limit: 255
    t.boolean  "requires_shipping", limit: 1
    t.string   "file_path",         limit: 255
    t.string   "mime_type",         limit: 255
    t.string   "subtitle",          limit: 255
  end

  add_index "products", ["author_id"], name: "index_products_on_author_id", using: :btree
  add_index "products", ["product_type_id"], name: "index_products_on_product_type_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,        null: false
    t.text     "data",       limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  add_foreign_key "discounts", "products", name: "fk_discounts_product_id", on_delete: :cascade
  add_foreign_key "order_details", "orders", name: "fk_order_details_order_id", on_delete: :cascade
  add_foreign_key "order_details", "products", name: "fk_order_details_product_id", on_delete: :cascade
  add_foreign_key "order_discounts", "discounts", name: "fk_order_discounts_discount_id", on_delete: :cascade
  add_foreign_key "order_discounts", "orders", name: "fk_order_discounts_order_id", on_delete: :cascade
  add_foreign_key "orders", "customers", name: "fk_orders_customer_id", on_delete: :cascade
  add_foreign_key "products", "authors", name: "fk_products_author_id", on_delete: :cascade
  add_foreign_key "products", "product_types", name: "fk_products_product_type_id", on_delete: :cascade
end
