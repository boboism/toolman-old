class CreateFacilityCodes < ActiveRecord::Migration
  def change
    create_table :facility_codes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
