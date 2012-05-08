class CreateTechnicalInfos < ActiveRecord::Migration
  def change
    create_table :technical_infos do |t|
      t.integer :sharpen_time
      t.integer :expected_quantity
      t.integer :actual_quantity
      t.decimal :expected_length
      t.decimal :actual_length
      t.references :tool_material

      t.timestamps
    end
    add_index :technical_infos, :tool_material_id
  end
end
