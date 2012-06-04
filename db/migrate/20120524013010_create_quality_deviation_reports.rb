class CreateQualityDeviationReports < ActiveRecord::Migration
  def change
    create_table :quality_deviation_reports do |t|
      t.string :doc_no
      t.date :doc_date
      t.integer :category_1_id
      t.integer :category_2_id
      t.integer :category_3_id
      t.integer :category_4_id
      t.integer :category_5_id
      t.integer :category_6_id
      t.string :title
      t.datetime :happen_start_time
      t.string :happen_start_team
      t.datetime :happen_end_time
      t.string :happen_end_team
      t.integer :stocking_quantity
      t.integer :bad_quantity
      t.integer :doc_user_id
      t.string :doc_user_type
      t.integer :assembly_tool_id
      t.text :reason
      t.string :reason_type
      t.text :solution
      t.text :suggestion

      t.timestamps
    end
    add_index :quality_deviation_reports, :doc_no
    add_index :quality_deviation_reports, :category_1_id
    add_index :quality_deviation_reports, :category_2_id
    add_index :quality_deviation_reports, :category_3_id
    add_index :quality_deviation_reports, :category_4_id
    add_index :quality_deviation_reports, :category_5_id
    add_index :quality_deviation_reports, :category_6_id
    add_index :quality_deviation_reports, :doc_user_id
  end
end
