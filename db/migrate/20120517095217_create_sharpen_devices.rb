class CreateSharpenDevices < ActiveRecord::Migration
  def change
    create_table :sharpen_devices do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :sharpen_devices, :name
  end
end
