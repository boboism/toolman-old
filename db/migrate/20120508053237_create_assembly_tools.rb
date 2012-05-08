class CreateAssemblyTools < ActiveRecord::Migration
  def change
    create_table :assembly_tools do |t|
      t.references :product_line
      t.references :facility_type
      t.references :facility_code
      t.references :workshop_process
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
      t.decimal :standard_setting_time

      t.timestamps
    end
    add_index :assembly_tools, :product_line_id
    add_index :assembly_tools, :facility_type_id
    add_index :assembly_tools, :facility_code_id
    add_index :assembly_tools, :workshop_process_id
    add_index :assembly_tools, :hilt_no
  end
end
