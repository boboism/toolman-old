class CreateToolParts < ActiveRecord::Migration
  def change
    create_table :tool_parts do |t|
      t.string :type
      t.string :part_no
      t.references :category
      t.references :sub_category
      t.string :model
      t.integer :expected_sharpen_time
      t.integer :actual_sharpen_time
      t.integer :expected_quantity
      t.integer :actual_quantity
      t.date :effective_date
      t.date :expired_date
      t.references :tool_material

      t.timestamps
    end
    add_index :tool_parts, :type
    add_index :tool_parts, :part_no
    add_index :tool_parts, :category_id
    add_index :tool_parts, :sub_category_id
    add_index :tool_parts, :model
    add_index :tool_parts, :tool_material_id
  end
end
