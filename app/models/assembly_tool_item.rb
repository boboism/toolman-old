class AssemblyToolItem < ActiveRecord::Base
  belongs_to :assembly_tool
  belongs_to :tool_material
  attr_accessible :quantity, :standard_sharpen_time, :uom
end
