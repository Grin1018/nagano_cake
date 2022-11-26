# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_25_091026) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customers_id"
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customers_id"], name: "index_addresses_on_customers_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "item_id_id"
    t.integer "customer_id_id"
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id_id"], name: "index_cart_items_on_customer_id_id"
    t.index ["item_id_id"], name: "index_cart_items_on_item_id_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "genres_id_id"
    t.string "name", null: false
    t.text "introduction", null: false
    t.integer "price", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genres_id_id"], name: "index_items_on_genres_id_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id_id"
    t.integer "item_id_id"
    t.integer "price", null: false
    t.integer "amount", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id_id"], name: "index_order_details_on_item_id_id"
    t.index ["order_id_id"], name: "index_order_details_on_order_id_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id_id"
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "name", null: false
    t.integer "shipping_cost", null: false
    t.integer "total_payment", null: false
    t.integer "payment_method", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id_id"], name: "index_orders_on_customer_id_id"
  end

  add_foreign_key "addresses", "customers", column: "customers_id"
  add_foreign_key "cart_items", "customer_ids"
  add_foreign_key "cart_items", "item_ids"
  add_foreign_key "items", "genres_ids"
  add_foreign_key "order_details", "item_ids"
  add_foreign_key "order_details", "order_ids"
  add_foreign_key "orders", "customer_ids"
end
