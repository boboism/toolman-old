class ScrapOrderItem < ActiveRecord::Base
  belongs_to :scrap_order
  belongs_to :replace_tool_part, :class_name => :ToolPart, :foreign_key => :replace_tool_part_id, :dependent => :destroy, :autosave => true
  belongs_to :scrap_tool_part, :class_name => :ToolPart, :foreign_key => :scrap_tool_part_id, :autosave => true

  attr_accessible :replace_tool_part_id, :scrap_tool_part_id, :scrap_tool_part, :replace_tool_part

  def to_str
    "#{scrap_tool_part} => #{replace_tool_part}"
  end
  alias to_label to_str
  alias to_s to_str
end
