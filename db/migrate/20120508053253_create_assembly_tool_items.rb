class CreateAssemblyToolItems < ActiveRecord::Migration
  def change
    create_table :assembly_tool_items do |t|
      t.integer :assembly_tool_id
      t.integer :tool_material_id
      t.integer :quantity
      t.integer :sharpen_device_id
      t.integer :sharpen_time

      t.timestamps
    end
    add_index :assembly_tool_items, :assembly_tool_id
    add_index :assembly_tool_items, :tool_material_id
    add_index :assembly_tool_items, :sharpen_device_id
  end
end
