class AddAssemblyToolItemToToolParts < ActiveRecord::Migration
  def change
    add_column :tool_parts, :assembly_tool_item_id, :integer
    add_index :tool_parts, :assembly_tool_item_id
  end
end
