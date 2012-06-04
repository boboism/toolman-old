class AddSettingDeviceAndSettingTypeToAssemblyTool < ActiveRecord::Migration
  def change
    add_column :assembly_tools, :setting_device_id, :integer
    add_index :assembly_tools, :setting_device_id
    add_column :assembly_tools, :setting_type_id, :integer
    add_index :assembly_tools, :setting_type_id
  end
end
