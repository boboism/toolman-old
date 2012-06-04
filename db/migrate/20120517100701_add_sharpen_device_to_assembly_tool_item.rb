class AddSharpenDeviceToAssemblyToolItem < ActiveRecord::Migration
  def change
    add_column :assembly_tool_items, :sharpen_device_id, :integer
    add_index :assembly_tool_items, :sharpen_device_id
  end
end
