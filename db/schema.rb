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

ActiveRecord::Schema.define(version: 20140619113951) do

  create_table "addresses", force: true do |t|
    t.string  "address1",           limit: 100, default: "", null: false
    t.string  "address2",           limit: 100
    t.string  "city",               limit: 50,  default: "", null: false
    t.string  "postal_code",        limit: 16,  default: "", null: false
    t.integer "country_id"
    t.integer "state_id"
    t.string  "daytime_phone"
    t.string  "email"
    t.string  "dealer_name_number"
  end

  add_index "addresses", ["country_id"], name: "fk_address_country", using: :btree
  add_index "addresses", ["state_id"], name: "fk_address_state", using: :btree

  create_table "car_manufacturers", force: true do |t|
    t.string "name", limit: 50, default: "", null: false
    t.string "code", limit: 4,  default: "", null: false
  end

  create_table "car_manufacturers_users", id: false, force: true do |t|
    t.integer "car_manufacturer_id", default: 0, null: false
    t.integer "user_id",             default: 0, null: false
  end

  add_index "car_manufacturers_users", ["user_id"], name: "fk_cp_user", using: :btree

  create_table "countries", force: true do |t|
    t.string  "iso",            limit: 2,   default: "", null: false
    t.string  "iso3",           limit: 3,   default: "", null: false
    t.string  "name",           limit: 100, default: "", null: false
    t.integer "numcode",                    default: 0,  null: false
    t.string  "printable_name", limit: 100, default: "", null: false
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "item_types", force: true do |t|
    t.string "name", limit: 20, default: "", null: false
  end

  create_table "line_items", force: true do |t|
    t.integer "quantity",                           default: 0,   null: false
    t.decimal "unit_price", precision: 8, scale: 2, default: 0.0, null: false
    t.integer "product_id",                         default: 0,   null: false
    t.integer "order_id",                           default: 0,   null: false
  end

  add_index "line_items", ["order_id"], name: "fk_items_order", using: :btree
  add_index "line_items", ["product_id"], name: "fk_items_product", using: :btree

  create_table "logged_exceptions", force: true do |t|
    t.string   "exception_class"
    t.string   "controller_name"
    t.string   "action_name"
    t.text     "message"
    t.text     "backtrace"
    t.text     "environment"
    t.text     "request"
    t.datetime "created_at"
  end

  create_table "orders", force: true do |t|
    t.string   "purchase_order",         limit: 50
    t.integer  "status",                                                    default: 0,     null: false
    t.integer  "customer_id",                                               default: 0,     null: false
    t.integer  "shipping_address_id",                                       default: 0,     null: false
    t.integer  "price_code_id",                                             default: 0
    t.datetime "created_on"
    t.datetime "updated_at"
    t.datetime "shipped_on"
    t.text     "additional_information"
    t.datetime "billed_on"
    t.string   "carrier",                limit: 25
    t.string   "tracking_number",        limit: 50
    t.float    "cod_charge"
    t.float    "brokerage_fees"
    t.float    "administrative_fees"
    t.string   "payment_terms",          limit: 25
    t.string   "legacy_invoice",         limit: 25
    t.boolean  "open",                                                      default: false
    t.float    "rebate"
    t.integer  "billing_address_id"
    t.string   "payment_method"
    t.float    "intact_unit_price"
    t.boolean  "draft",                                                     default: false
    t.boolean  "deleted",                                                   default: false
    t.datetime "deleted_at"
    t.decimal  "transport_costs",                   precision: 8, scale: 2, default: 0.0
  end

  add_index "orders", ["customer_id"], name: "fk_orders_customer", using: :btree
  add_index "orders", ["draft"], name: "index_orders_on_draft", using: :btree
  add_index "orders", ["price_code_id"], name: "fk_orders_price_code", using: :btree
  add_index "orders", ["shipping_address_id"], name: "fk_orders_shipping", using: :btree

  create_table "price_codes", force: true do |t|
    t.string "name", limit: 25, default: "", null: false
  end

  create_table "products", force: true do |t|
    t.string  "type",                      limit: 25,                          default: "",    null: false
    t.string  "manufacturer_part_number",  limit: 50,                          default: "",    null: false
    t.string  "tupp_part_number",          limit: 50,                          default: "",    null: false
    t.string  "name",                      limit: 100,                         default: "",    null: false
    t.integer "country_id",                                                    default: 0,     null: false
    t.integer "color_manufacturer_id"
    t.integer "accessory_manufacturer_id"
    t.integer "manufacturer_item_type_id"
    t.integer "generic_item_type_id"
    t.string  "image_url",                 limit: 50
    t.text    "description"
    t.integer "special_type"
    t.integer "piaggio_id"
    t.integer "piaggio_accessory_type_id"
    t.boolean "enabled",                                                       default: true
    t.boolean "scooter",                                                       default: false
    t.boolean "sym",                                                           default: false
    t.integer "autovisual_manu_id"
    t.decimal "unit_price",                            precision: 9, scale: 2
    t.integer "customer_id"
  end

  add_index "products", ["accessory_manufacturer_id"], name: "fk_accessory_manufacturer", using: :btree
  add_index "products", ["color_manufacturer_id"], name: "fk_color_manufacturer", using: :btree
  add_index "products", ["country_id"], name: "fk_product_country", using: :btree
  add_index "products", ["enabled"], name: "index_products_on_enabled", using: :btree
  add_index "products", ["generic_item_type_id"], name: "fk_generic_item", using: :btree
  add_index "products", ["manufacturer_item_type_id"], name: "fk_manufacturer_item", using: :btree
  add_index "products", ["scooter"], name: "index_products_on_scooter", using: :btree

  create_table "report_generators", force: true do |t|
    t.string "name", limit: 25, default: "", null: false
  end

  create_table "schema_info", id: false, force: true do |t|
    t.integer "version"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id",                    null: false
    t.text     "data",       limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "states", force: true do |t|
    t.string  "code",        limit: 10,  default: "", null: false
    t.string  "name",        limit: 100, default: "", null: false
    t.integer "country_id",              default: 0,  null: false
    t.integer "tax_code_id"
  end

  add_index "states", ["country_id"], name: "fk_state_country", using: :btree

  create_table "tax_codes", force: true do |t|
    t.integer  "state_id"
    t.decimal  "rate",       precision: 8, scale: 5
    t.string   "label"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "untested_models", force: true do |t|
    t.string   "field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "type",                   limit: 20,  default: "",    null: false
    t.string   "login",                  limit: 80,  default: "",    null: false
    t.string   "salted_password",        limit: 40,  default: "",    null: false
    t.datetime "created_on"
    t.datetime "updated_at"
    t.string   "email",                  limit: 60
    t.string   "name",                   limit: 60,  default: "",    null: false
    t.string   "salt",                   limit: 40,  default: "",    null: false
    t.integer  "verified",                           default: 0
    t.string   "role",                   limit: 40
    t.string   "security_token",         limit: 40
    t.datetime "token_expiry"
    t.integer  "deleted",                            default: 0
    t.text     "additional_information"
    t.string   "phone_number",           limit: 20
    t.string   "fax_number",             limit: 20
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "price_code_id"
    t.string   "dealership_name",        limit: 100
    t.string   "fein",                   limit: 20
    t.string   "company_name",           limit: 100
    t.string   "warehouse_location",     limit: 100
    t.datetime "logged_in_at"
    t.integer  "report_generator_id"
    t.string   "preferred_language",     limit: 5,   default: "en",  null: false
    t.string   "federal_tax_id"
    t.integer  "intact_min_qnt"
    t.float    "intact_unit_price"
    t.string   "administrative_region"
    t.string   "language"
    t.string   "contact_title"
    t.integer  "initial_order_qty"
    t.datetime "deleted_at"
    t.boolean  "changed_password",                   default: false
    t.integer  "tax_code_id"
  end

  add_index "users", ["billing_address_id"], name: "fk_user_billing_address", using: :btree
  add_index "users", ["login"], name: "index_users_on_login", using: :btree
  add_index "users", ["price_code_id"], name: "fk_user_price_code", using: :btree
  add_index "users", ["shipping_address_id"], name: "fk_user_shipping_address", using: :btree

end
