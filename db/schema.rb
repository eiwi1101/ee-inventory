# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_21_030400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturer_parts", force: :cascade do |t|
    t.bigint "manufacturer_id", null: false
    t.bigint "part_id", null: false
    t.string "part_number"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_manufacturer_parts_on_manufacturer_id"
    t.index ["part_id"], name: "index_manufacturer_parts_on_part_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_parts", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "part_id", null: false
    t.integer "quantity_on_order"
    t.integer "total_cents"
    t.integer "amount_cents"
    t.string "total_currency"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_parts_on_order_id"
    t.index ["part_id"], name: "index_order_parts_on_part_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "supplier_id"
    t.string "status"
    t.integer "total_cents"
    t.string "total_currency"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_orders_on_supplier_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "surface_mount"
    t.integer "width"
    t.integer "height"
    t.integer "length"
    t.string "dimension_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "part_properties", force: :cascade do |t|
    t.bigint "part_id", null: false
    t.bigint "property_type_id", null: false
    t.decimal "property_value"
    t.decimal "property_value_min"
    t.decimal "property_value_max"
    t.string "property_value_str"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_id"], name: "index_part_properties_on_part_id"
    t.index ["property_type_id"], name: "index_part_properties_on_property_type_id"
  end

  create_table "part_stocks", force: :cascade do |t|
    t.bigint "stock_location_id"
    t.bigint "part_id", null: false
    t.integer "quantity_on_hand"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_id"], name: "index_part_stocks_on_part_id"
    t.index ["stock_location_id"], name: "index_part_stocks_on_stock_location_id"
  end

  create_table "part_types", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_part_types_on_category_id"
  end

  create_table "part_usages", force: :cascade do |t|
    t.bigint "part_id", null: false
    t.bigint "project_id"
    t.bigint "project_part_id"
    t.integer "quantity_used"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_id"], name: "index_part_usages_on_part_id"
    t.index ["project_id"], name: "index_part_usages_on_project_id"
    t.index ["project_part_id"], name: "index_part_usages_on_project_part_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "part_number"
    t.bigint "package_id"
    t.decimal "value"
    t.string "value_unit"
    t.integer "quantity_ordered"
    t.integer "quantity_on_hand"
    t.integer "quantity_on_order"
    t.integer "quantity_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "part_type_id", null: false
    t.index ["package_id"], name: "index_parts_on_package_id"
    t.index ["part_type_id"], name: "index_parts_on_part_type_id"
  end

  create_table "project_parts", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "part_id", null: false
    t.integer "quantity_required"
    t.string "symbols"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_id"], name: "index_project_parts_on_part_id"
    t.index ["project_id"], name: "index_project_parts_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "property_unit"
    t.string "property_unit_name"
    t.boolean "numeric"
    t.boolean "variable"
    t.bigint "part_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_type_id"], name: "index_property_types_on_part_type_id"
  end

  create_table "stock_locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "parts_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supplier_parts", force: :cascade do |t|
    t.bigint "supplier_id", null: false
    t.bigint "part_id", null: false
    t.bigint "manufacturer_part_id"
    t.string "part_number"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_part_id"], name: "index_supplier_parts_on_manufacturer_part_id"
    t.index ["part_id"], name: "index_supplier_parts_on_part_id"
    t.index ["supplier_id"], name: "index_supplier_parts_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "manufacturer_parts", "manufacturers"
  add_foreign_key "manufacturer_parts", "parts"
  add_foreign_key "order_parts", "orders"
  add_foreign_key "order_parts", "parts"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "part_properties", "parts"
  add_foreign_key "part_properties", "property_types"
  add_foreign_key "part_stocks", "parts"
  add_foreign_key "part_stocks", "stock_locations"
  add_foreign_key "part_types", "categories"
  add_foreign_key "part_usages", "parts"
  add_foreign_key "part_usages", "project_parts"
  add_foreign_key "part_usages", "projects"
  add_foreign_key "parts", "packages"
  add_foreign_key "parts", "part_types"
  add_foreign_key "project_parts", "parts"
  add_foreign_key "project_parts", "projects"
  add_foreign_key "property_types", "part_types"
  add_foreign_key "supplier_parts", "manufacturer_parts"
  add_foreign_key "supplier_parts", "parts"
  add_foreign_key "supplier_parts", "suppliers"
end
