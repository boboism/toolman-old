class AddAssembledToAssemblyToolItem < ActiveRecord::Migration
  def change
    add_column :assembly_tool_items, :assembled, :boolean
    add_index :assembly_tool_items, :assembled
  end
end
