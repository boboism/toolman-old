class CreateSettingDevices < ActiveRecord::Migration
  def change
    create_table :setting_devices do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :setting_devices, :name
  end
end
