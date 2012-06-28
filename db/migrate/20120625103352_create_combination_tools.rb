class CreateCombinationTools < ActiveRecord::Migration
  def change
    create_table :combination_tools do |t|
      t.references :assembly_tool
      t.string :stock_status
      t.integer :stock_out_operator_id
      t.datetime :stock_out_date
      t.integer :stock_in_operator_id
      t.datetime :stock_in_date

      t.timestamps
    end
    add_index :combination_tools, :assembly_tool_id
    add_index :combination_tools, :stock_status
    add_index :combination_tools, :stock_out_operator_id
    add_index :combination_tools, :stock_in_operator_id
  end
end
