class CreateAssemblyToolItemInServiceToolPartShips < ActiveRecord::Migration
  def change
    create_table :assembly_tool_item_in_service_tool_part_ships do |t|
      t.references :assembly_tool_item
      t.references :in_service_tool_part

      t.timestamps
    end
    add_index :assembly_tool_item_in_service_tool_part_ships, :assembly_tool_item_id, {name: :index_tool_item_tool_part_ships_item}
    add_index :assembly_tool_item_in_service_tool_part_ships, :in_service_tool_part_id, {name: :index_tool_item_tool_part_ships_part}
  end
end
