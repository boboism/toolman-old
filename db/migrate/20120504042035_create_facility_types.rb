class CreateFacilityTypes < ActiveRecord::Migration
  def change
    create_table :facility_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
