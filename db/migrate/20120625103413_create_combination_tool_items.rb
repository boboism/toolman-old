class CreateCombinationToolItems < ActiveRecord::Migration
  def change
    create_table :combination_tool_items do |t|
      t.references :combination_tool
      t.references :tool_part
      t.string :stock_status

      t.timestamps
    end
    add_index :combination_tool_items, :combination_tool_id
    add_index :combination_tool_items, :tool_part_id
    add_index :combination_tool_items, :stock_status
  end
end
