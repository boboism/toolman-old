class CreateTechnicalInfos < ActiveRecord::Migration
  def change
    create_table :technical_infos do |t|
      t.integer :tool_material_id
      t.integer :sharpen_time
      t.integer :perform_quantity

      t.timestamps
    end
    add_index :technical_infos, :tool_material_id
  end
end
