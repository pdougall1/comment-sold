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

ActiveRecord::Schema.define(version: 2020_09_08_214250) do

  create_table "inventories", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity"
    t.text "color"
    t.text "size"
    t.integer "price_cents"
    t.integer "sale_price_cents"
    t.integer "cost_cents"
    t.string "sku"
    t.integer "weight"
    t.integer "length"
    t.integer "width"
    t.integer "height"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "inventory_id"
    t.integer "product_id"
    t.text "street_address"
    t.text "apartment"
    t.text "city"
    t.text "state"
    t.string "country_code"
    t.text "zip"
    t.string "phone_number"
    t.text "email"
    t.string "name"
    t.string "order_status"
    t.text "payment_ref"
    t.string "transaction_id"
    t.integer "payment_amt_cents"
    t.integer "ship_charged_cents"
    t.integer "ship_cost_cents"
    t.integer "subtotal_cents"
    t.integer "total_cents"
    t.text "shipper_name"
    t.datetime "payment_date"
    t.datetime "shipped_date"
    t.text "tracking_number"
    t.integer "tax_total_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.text "description"
    t.text "style"
    t.text "brand"
    t.string "url"
    t.string "product_type"
    t.integer "shipping_price"
    t.text "note"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "password_hash"
    t.string "password_plain"
    t.boolean "superadmin"
    t.string "shop_name"
    t.string "remember_token", limit: 100
    t.string "card_brand"
    t.string "card_last_four"
    t.datetime "trial_ends_at"
    t.string "shop_domain"
    t.boolean "is_enabled"
    t.string "billing_plan"
    t.datetime "trial_starts_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
