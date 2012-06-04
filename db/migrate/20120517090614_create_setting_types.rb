class CreateSettingTypes < ActiveRecord::Migration
  def change
    create_table :setting_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :setting_types, :name
  end
end
