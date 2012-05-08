class AssemblyToolItemInServiceToolPartShip < ActiveRecord::Base
  belongs_to :assembly_tool_item
  belongs_to :in_service_tool_part
  # attr_accessible :title, :body
end
