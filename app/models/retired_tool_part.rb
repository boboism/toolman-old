class RetiredToolPart < ToolPart
  belongs_to :category
  belongs_to :sub_category
  belongs_to :tool_material
  attr_accessible :actual_quantity, :actual_sharpen_time, :effective_date, :expected_quantity, :expected_sharpen_time, :expired_date, :model, :part_no, :type, :in_service
end
