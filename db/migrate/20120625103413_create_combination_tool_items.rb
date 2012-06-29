class CreateCombinationToolItems < ActiveRecord::Migration
  def change
    create_table :combination_tool_items do |t|
      t.integer :combination_tool_id
      t.integer :tool_material_id
      t.integer :tool_part_id
      t.string :stock_status

      t.timestamps
    end
    add_index :combination_tool_items, :combination_tool_id
    add_index :combination_tool_items, :tool_part_id
    add_index :combination_tool_items, :stock_status
    add_index :combination_tool_items, :tool_material_id
  end
end
