class CreateArchiveFiles < ActiveRecord::Migration
  def change
    create_table :archive_files do |t|
      t.string :type
      t.string :name
      t.string :file_suffix
      t.integer :size
      t.string :url

      t.timestamps
    end
    add_index :archive_files, :type
  end
end
