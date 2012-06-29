class CombinationToolItem < ActiveRecord::Base
  belongs_to :combination_tool
  belongs_to :tool_part
  belongs_to :tool_material
  attr_accessible :stock_status, :tool_part_id, :tool_material_id

  def part_no=(value)
    self.tool_part = self.tool_material.serving_parts.find_by_part_no(value)
  end
  def part_no
    self.tool_part.part_no if self.tool_part
  end
end
