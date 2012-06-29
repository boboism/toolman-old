class CreateToolParts < ActiveRecord::Migration
  def change
    create_table :tool_parts do |t|
      t.string :type
      t.string :part_no
      t.integer :category_id
      t.integer :sub_category_id
      t.boolean :is_active
      t.string :model
      t.integer :total_sharpen_time
      t.integer :total_process_quantity
      t.date :effective_date
      t.date :expired_date
      t.integer :tool_material_id

      t.timestamps
    end
    add_index :tool_parts, :type
    add_index :tool_parts, :is_active
    add_index :tool_parts, :part_no
    add_index :tool_parts, :category_id
    add_index :tool_parts, :sub_category_id
    add_index :tool_parts, :model
    add_index :tool_parts, :tool_material_id
  end
end
