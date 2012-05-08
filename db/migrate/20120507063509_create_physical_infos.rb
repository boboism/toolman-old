class CreatePhysicalInfos < ActiveRecord::Migration
  def change
    create_table :physical_infos do |t|
      t.decimal :first_diameter
      t.decimal :step_length
      t.decimal :second_diameter
      t.decimal :slot_length
      t.decimal :gross_length
      t.decimal :hilt_length
      t.references :tool_material

      t.timestamps
    end
    add_index :physical_infos, :tool_material_id
  end
end
