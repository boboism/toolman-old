class CreateAssemblyToolEngineModelShips < ActiveRecord::Migration
  def change
    create_table :assembly_tool_engine_model_ships do |t|
      t.references :assembly_tool
      t.references :engine_model

      t.timestamps
    end
    add_index :assembly_tool_engine_model_ships, :assembly_tool_id
    add_index :assembly_tool_engine_model_ships, :engine_model_id
  end
end
