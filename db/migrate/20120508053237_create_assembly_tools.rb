class CreateAssemblyTools < ActiveRecord::Migration
  def change
    create_table :assembly_tools do |t|
      t.integer :product_line_id
      t.integer :facility_type_id
      t.integer :facility_code_id
      t.integer :workshop_process_id
      t.string :hilt_no
      t.string :processing_position
      t.string :processing_hole
      t.integer :tool_part_quantity
      t.decimal :rpm
      t.decimal :first_velocity
      t.decimal :max_diameter
      t.decimal :max_velocity
      t.decimal :feed_speed
      t.decimal :blade_quantity
      t.boolean :is_confirm
      t.integer :setting_device_id
      t.integer :setting_type_id
      t.integer :setting_time
      t.timestamps
    end
    add_index :assembly_tools, :product_line_id
    add_index :assembly_tools, :facility_type_id
    add_index :assembly_tools, :facility_code_id
    add_index :assembly_tools, :workshop_process_id
    add_index :assembly_tools, :is_confirm
    add_index :assembly_tools, :hilt_no
    add_index :assembly_tools, :setting_device_id
    add_index :assembly_tools, :setting_type_id
  end
end
