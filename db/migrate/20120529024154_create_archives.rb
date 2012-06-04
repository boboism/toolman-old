class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :type
      t.integer :archivable_id
      t.string :archivable_type
      t.timestamps
    end
    add_index :archives, :type
    add_index :archives, :archivable_id
  end
end
