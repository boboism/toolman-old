class CreateQualityCategories < ActiveRecord::Migration
  def change
    create_table :quality_categories do |t|
      t.string :quality_type
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :quality_categories, :quality_type
    add_index :quality_categories, :name
  end
end
