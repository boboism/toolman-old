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

ActiveRecord::Schema.define(:version => 20120601005453) do

  create_table "archives", :force => true do |t|
    t.string   "type"
    t.integer  "archivable_id"
    t.string   "archivable_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "archive_file_name"
    t.string   "archive_content_type"
    t.integer  "archive_file_size"
    t.datetime "archive_updated_at"
  end

  add_index "archives", ["archivable_id"], :name => "index_archives_on_archivable_id"
  add_index "archives", ["type"], :name => "index_archives_on_type"

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
    t.integer  "quantity"
    t.string   "uom"
    t.integer  "standard_sharpen_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.boolean  "assembled"
    t.integer  "sharpen_device_id"
  end

  add_index "assembly_tool_items", ["assembled"], :name => "index_assembly_tool_items_on_assembled"
  add_index "assembly_tool_items", ["assembly_tool_id"], :name => "index_assembly_tool_items_on_assembly_tool_id"
  add_index "assembly_tool_items", ["sharpen_device_id"], :name => "index_assembly_tool_items_on_sharpen_device_id"
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
    t.boolean  "assembled"
    t.integer  "setting_device_id"
    t.integer  "setting_type_id"
    t.boolean  "confirmed"
    t.string   "stock_status"
  end

  add_index "assembly_tools", ["assembled"], :name => "index_assembly_tools_on_assembled"
  add_index "assembly_tools", ["confirmed"], :name => "index_assembly_tools_on_confirmed"
  add_index "assembly_tools", ["facility_code_id"], :name => "index_assembly_tools_on_facility_code_id"
  add_index "assembly_tools", ["facility_type_id"], :name => "index_assembly_tools_on_facility_type_id"
  add_index "assembly_tools", ["hilt_no"], :name => "index_assembly_tools_on_hilt_no"
  add_index "assembly_tools", ["product_line_id"], :name => "index_assembly_tools_on_product_line_id"
  add_index "assembly_tools", ["setting_device_id"], :name => "index_assembly_tools_on_setting_device_id"
  add_index "assembly_tools", ["setting_type_id"], :name => "index_assembly_tools_on_setting_type_id"
  add_index "assembly_tools", ["stock_status"], :name => "index_assembly_tools_on_stock_status"
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

  create_table "quality_categories", :force => true do |t|
    t.string   "quality_type"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "quality_categories", ["name"], :name => "index_quality_categories_on_name"
  add_index "quality_categories", ["quality_type"], :name => "index_quality_categories_on_quality_type"

  create_table "quality_deviation_reports", :force => true do |t|
    t.string   "doc_no"
    t.date     "doc_date"
    t.integer  "category_1_id"
    t.integer  "category_2_id"
    t.integer  "category_3_id"
    t.integer  "category_4_id"
    t.integer  "category_5_id"
    t.integer  "category_6_id"
    t.string   "title"
    t.datetime "happen_start_time"
    t.string   "happen_start_team"
    t.datetime "happen_end_time"
    t.string   "happen_end_team"
    t.integer  "stocking_quantity"
    t.integer  "bad_quantity"
    t.integer  "doc_user_id"
    t.string   "doc_user_type"
    t.integer  "assembly_tool_id"
    t.text     "reason"
    t.string   "reason_type"
    t.text     "solution"
    t.text     "suggestion"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "confirmed"
  end

  add_index "quality_deviation_reports", ["category_1_id"], :name => "index_quality_deviation_reports_on_category_1_id"
  add_index "quality_deviation_reports", ["category_2_id"], :name => "index_quality_deviation_reports_on_category_2_id"
  add_index "quality_deviation_reports", ["category_3_id"], :name => "index_quality_deviation_reports_on_category_3_id"
  add_index "quality_deviation_reports", ["category_4_id"], :name => "index_quality_deviation_reports_on_category_4_id"
  add_index "quality_deviation_reports", ["category_5_id"], :name => "index_quality_deviation_reports_on_category_5_id"
  add_index "quality_deviation_reports", ["category_6_id"], :name => "index_quality_deviation_reports_on_category_6_id"
  add_index "quality_deviation_reports", ["confirmed"], :name => "index_quality_deviation_reports_on_confirmed"
  add_index "quality_deviation_reports", ["doc_no"], :name => "index_quality_deviation_reports_on_doc_no"
  add_index "quality_deviation_reports", ["doc_user_id"], :name => "index_quality_deviation_reports_on_doc_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "scrap_order_items", :force => true do |t|
    t.integer  "scrap_order_id"
    t.integer  "scrap_tool_part_id"
    t.integer  "replace_tool_part_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "scrap_order_items", ["replace_tool_part_id"], :name => "index_scrap_order_items_on_replace_tool_part_id"
  add_index "scrap_order_items", ["scrap_order_id"], :name => "index_scrap_order_items_on_scrap_order_id"
  add_index "scrap_order_items", ["scrap_tool_part_id"], :name => "index_scrap_order_items_on_scrap_tool_part_id"

  create_table "scrap_orders", :force => true do |t|
    t.integer  "assembly_tool_id"
    t.integer  "doc_user_id"
    t.date     "doc_date"
    t.boolean  "confirmed"
    t.integer  "scrap_type_id"
    t.text     "scrap_reason"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "scrap_orders", ["assembly_tool_id"], :name => "index_scrap_orders_on_assembly_tool_id"
  add_index "scrap_orders", ["confirmed"], :name => "index_scrap_orders_on_confirmed"
  add_index "scrap_orders", ["doc_user_id"], :name => "index_scrap_orders_on_doc_user_id"
  add_index "scrap_orders", ["scrap_type_id"], :name => "index_scrap_orders_on_scrap_type_id"

  create_table "scrap_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "scrap_types", ["name"], :name => "index_scrap_types_on_name"

  create_table "service_stock_orders", :force => true do |t|
    t.string   "io"
    t.integer  "doc_user_id"
    t.datetime "doc_date"
    t.integer  "operator_id"
    t.integer  "assembly_tool_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "operation_date"
  end

  add_index "service_stock_orders", ["assembly_tool_id"], :name => "index_service_stock_orders_on_assembly_tool_id"
  add_index "service_stock_orders", ["doc_user_id"], :name => "index_service_stock_orders_on_doc_user_id"
  add_index "service_stock_orders", ["io"], :name => "index_service_stock_orders_on_io"
  add_index "service_stock_orders", ["operator_id"], :name => "index_service_stock_orders_on_operator_id"

  create_table "setting_devices", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "setting_devices", ["name"], :name => "index_setting_devices_on_name"

  create_table "setting_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "setting_types", ["name"], :name => "index_setting_types_on_name"

  create_table "sharpen_devices", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sharpen_devices", ["name"], :name => "index_sharpen_devices_on_name"

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
    t.integer  "assembly_tool_item_id"
    t.boolean  "in_service"
  end

  add_index "tool_parts", ["assembly_tool_item_id"], :name => "index_tool_parts_on_assembly_tool_item_id"
  add_index "tool_parts", ["category_id"], :name => "index_tool_parts_on_category_id"
  add_index "tool_parts", ["in_service"], :name => "index_tool_parts_on_in_service"
  add_index "tool_parts", ["model"], :name => "index_tool_parts_on_model"
  add_index "tool_parts", ["part_no"], :name => "index_tool_parts_on_part_no"
  add_index "tool_parts", ["sub_category_id"], :name => "index_tool_parts_on_sub_category_id"
  add_index "tool_parts", ["tool_material_id"], :name => "index_tool_parts_on_tool_material_id"
  add_index "tool_parts", ["type"], :name => "index_tool_parts_on_type"

  create_table "tunning_work_order_items", :force => true do |t|
    t.string   "type"
    t.integer  "tunning_work_order_id"
    t.integer  "operation_device_id"
    t.integer  "tool_part_id"
    t.integer  "expected_time"
    t.integer  "actual_time"
    t.integer  "expected_quantity"
    t.integer  "actual_quantity"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "operation_type_id"
    t.integer  "operator_id"
  end

  add_index "tunning_work_order_items", ["operation_device_id"], :name => "index_tunning_work_order_items_on_operation_device_id"
  add_index "tunning_work_order_items", ["operation_type_id"], :name => "index_tunning_work_order_items_on_operation_type_id"
  add_index "tunning_work_order_items", ["operator_id"], :name => "index_tunning_work_order_items_on_operator_id"
  add_index "tunning_work_order_items", ["tool_part_id"], :name => "index_tunning_work_order_items_on_tool_part_id"
  add_index "tunning_work_order_items", ["tunning_work_order_id"], :name => "index_tunning_work_order_items_on_tunning_work_order_id"
  add_index "tunning_work_order_items", ["type"], :name => "index_tunning_work_order_items_on_type"

  create_table "tunning_work_orders", :force => true do |t|
    t.date     "doc_date"
    t.integer  "doc_user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "assembly_tool_id"
    t.boolean  "confirmed"
  end

  add_index "tunning_work_orders", ["assembly_tool_id"], :name => "index_tunning_work_orders_on_assembly_tool_id"
  add_index "tunning_work_orders", ["confirmed"], :name => "index_tunning_work_orders_on_confirmed"
  add_index "tunning_work_orders", ["doc_user_id"], :name => "index_tunning_work_orders_on_doc_user_id"

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
    t.string   "nickname"
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
