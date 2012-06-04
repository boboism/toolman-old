class AddInServiceToToolPart < ActiveRecord::Migration
  def change
    add_column :tool_parts, :in_service, :boolean
    add_index :tool_parts, :in_service
  end
end
