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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120508053302) do

  create_table "archive_files", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "file_suffix"
    t.integer  "size"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "archive_files", ["type"], :name => "index_archive_files_on_type"

  create_table "assembly_tool_engine_model_ships", :force => true do |t|
    t.integer  "assembly_tool_id"
    t.integer  "engine_model_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "assembly_tool_engine_model_ships", ["assembly_tool_id"], :name => "index_assembly_tool_engine_model_ships_on_assembly_tool_id"
  add_index "assembly_tool_engine_model_ships", ["engine_model_id"], :name => "index_assembly_tool_engine_model_ships_on_engine_model_id"

  create_table "assembly_tool_item_in_service_tool_part_ships", :force => true do |t|
    t.integer  "assembly_tool_item_id"
    t.integer  "in_service_tool_part_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "assembly_tool_item_in_service_tool_part_ships", ["assembly_tool_item_id"], :name => "index_tool_item_tool_part_ships_item"
  add_index "assembly_tool_item_in_service_tool_part_ships", ["in_service_tool_part_id"], :name => "index_tool_item_tool_part_ships_part"

  create_table "assembly_tool_items", :force => true do |t|
    t.integer  "assembly_tool_id"
    t.integer  "tool_material_id"
    t.decimal  "quantity"
    t.string   "uom"
    t.decimal  "standard_sharpen_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "assembly_tool_items", ["assembly_tool_id"], :name => "index_assembly_tool_items_on_assembly_tool_id"
  add_index "assembly_tool_items", ["tool_material_id"], :name => "index_assembly_tool_items_on_tool_material_id"

  create_table "assembly_tools", :force => true do |t|
    t.integer  "product_line_id"
    t.integer  "facility_type_id"
    t.integer  "facility_code_id"
    t.integer  "workshop_process_id"
    t.string   "hilt_no"
    t.string   "processing_position"
    t.string   "processing_hole"
    t.integer  "tool_part_quantity"
    t.decimal  "rpm"
    t.decimal  "first_velocity"
    t.decimal  "max_diameter"
    t.decimal  "max_velocity"
    t.decimal  "feed_speed"
    t.decimal  "blade_quantity"
    t.decimal  "standard_setting_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "assembly_tools", ["facility_code_id"], :name => "index_assembly_tools_on_facility_code_id"
  add_index "assembly_tools", ["facility_type_id"], :name => "index_assembly_tools_on_facility_type_id"
  add_index "assembly_tools", ["hilt_no"], :name => "index_assembly_tools_on_hilt_no"
  add_index "assembly_tools", ["product_line_id"], :name => "index_assembly_tools_on_product_line_id"
  add_index "assembly_tools", ["workshop_process_id"], :name => "index_assembly_tools_on_workshop_process_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "engine_models", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "facility_codes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "facility_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "physical_infos", :force => true do |t|
    t.decimal  "first_diameter"
    t.decimal  "step_length"
    t.decimal  "second_diameter"
    t.decimal  "slot_length"
    t.decimal  "gross_length"
    t.decimal  "hilt_length"
    t.integer  "tool_material_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "physical_infos", ["tool_material_id"], :name => "index_physical_infos_on_tool_material_id"

  create_table "product_lines", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "purchase_infos", :force => true do |t|
    t.string   "purchase_no"
    t.integer  "manufacturer_id"
    t.integer  "agency_id"
    t.decimal  "unit_price"
    t.decimal  "quantity"
    t.integer  "tool_material_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "purchase_infos", ["agency_id"], :name => "index_purchase_infos_on_agency_id"
  add_index "purchase_infos", ["manufacturer_id"], :name => "index_purchase_infos_on_manufacturer_id"
  add_index "purchase_infos", ["purchase_no"], :name => "index_purchase_infos_on_purchase_no"
  add_index "purchase_infos", ["tool_material_id"], :name => "index_purchase_infos_on_tool_material_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "stocking_infos", :force => true do |t|
    t.string   "stock_no"
    t.string   "stack_no"
    t.decimal  "current_quantity"
    t.decimal  "max_quantity"
    t.decimal  "min_quantity"
    t.integer  "tool_material_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "stocking_infos", ["stack_no"], :name => "index_stocking_infos_on_stack_no"
  add_index "stocking_infos", ["stock_no"], :name => "index_stocking_infos_on_stock_no"
  add_index "stocking_infos", ["tool_material_id"], :name => "index_stocking_infos_on_tool_material_id"

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "company_name"
    t.string   "address"
    t.string   "postbox"
    t.string   "tel"
    t.string   "linkman"
    t.string   "website"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "suppliers", ["name"], :name => "index_suppliers_on_name"
  add_index "suppliers", ["type"], :name => "index_suppliers_on_type"

  create_table "technical_infos", :force => true do |t|
    t.integer  "sharpen_time"
    t.integer  "expected_quantity"
    t.integer  "actual_quantity"
    t.decimal  "expected_length"
    t.decimal  "actual_length"
    t.integer  "tool_material_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "technical_infos", ["tool_material_id"], :name => "index_technical_infos_on_tool_material_id"

  create_table "tool_materials", :force => true do |t|
    t.string   "tool_no"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.string   "model"
    t.boolean  "standardized"
    t.integer  "service_quantity"
    t.boolean  "sharpen_part"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "tool_materials", ["category_id"], :name => "index_tool_materials_on_category_id"
  add_index "tool_materials", ["model"], :name => "index_tool_materials_on_model"
  add_index "tool_materials", ["sub_category_id"], :name => "index_tool_materials_on_sub_category_id"
  add_index "tool_materials", ["tool_no"], :name => "index_tool_materials_on_tool_no"

  create_table "tool_parts", :force => true do |t|
    t.string   "type"
    t.string   "part_no"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.string   "model"
    t.integer  "expected_sharpen_time"
    t.integer  "actual_sharpen_time"
    t.integer  "expected_quantity"
    t.integer  "actual_quantity"
    t.date     "effective_date"
    t.date     "expired_date"
    t.integer  "tool_material_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "tool_parts", ["category_id"], :name => "index_tool_parts_on_category_id"
  add_index "tool_parts", ["model"], :name => "index_tool_parts_on_model"
  add_index "tool_parts", ["part_no"], :name => "index_tool_parts_on_part_no"
  add_index "tool_parts", ["sub_category_id"], :name => "index_tool_parts_on_sub_category_id"
  add_index "tool_parts", ["tool_material_id"], :name => "index_tool_parts_on_tool_material_id"
  add_index "tool_parts", ["type"], :name => "index_tool_parts_on_type"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "workshop_processes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
