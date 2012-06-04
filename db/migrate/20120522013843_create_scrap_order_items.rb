class CreateScrapOrderItems < ActiveRecord::Migration
  def change
    create_table :scrap_order_items do |t|
      t.references :scrap_order
      t.integer :scrap_tool_part_id
      t.integer :replace_tool_part_id

      t.timestamps
    end
    add_index :scrap_order_items, :scrap_order_id
    add_index :scrap_order_items, :scrap_tool_part_id
    add_index :scrap_order_items, :replace_tool_part_id
  end
end
