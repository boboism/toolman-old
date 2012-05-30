class InServiceToolPart < ToolPart
  belongs_to :category
  belongs_to :sub_category
  belongs_to :tool_material
  belongs_to :assembly_tool_item
  attr_accessible :actual_quantity, :actual_sharpen_time, :effective_date, :expected_quantity, :expected_sharpen_time, :expired_date, :model, :part_no, :category_id, :sub_category_id, :tool_material_id, :in_service

  def self.available(assembly_tool_item = nil)
    assembly_tool_item_id = assembly_tool_item.nil? ? -1 : assembly_tool_item.id
    where('assembly_tool_item_id is null or assembly_tool_item_id = ?', assembly_tool_item_id)
  end

  def self.unavailable
    where('assembly_tool_item_id is not null')
  end

  def assembled?
    not assembly_tool_item.nil?
  end

  def to_str
    "#{category} #{sub_category} #{part_no}"
  end
  alias to_laebel to_str
  alias to_s to_str
end

