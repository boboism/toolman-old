class CreateWorkshopProcesses < ActiveRecord::Migration
  def change
    create_table :workshop_processes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
