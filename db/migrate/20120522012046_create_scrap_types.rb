class CreateScrapTypes < ActiveRecord::Migration
  def change
    create_table :scrap_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :scrap_types, :name
  end
end
