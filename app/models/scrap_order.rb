class ScrapOrder < ActiveRecord::Base
  default_value_for :confirmed, false 
  default_value_for :scrap_type_id, 1

  belongs_to :assembly_tool
  belongs_to :scrap_type
  belongs_to :doc_user, :class_name => :User, :foreign_key => :doc_user_id

  attr_accessible :confirmed, :doc_date, :doc_user_id, :scrap_reason, :assembly_tool_id, :scrap_type_id, :items_attributes, :scrap_tool_part_ids, :replace_tool_part_ids

  has_many :items, :class_name => :ScrapOrderItem, :foreign_key => :scrap_order_id, :dependent => :destroy, :autosave => true 
  has_many :scrap_tool_parts, :through => :items, :autosave => true
  has_many :replace_tool_parts, :through => :items, :dependent => :destroy, :autosave => true

  accepts_nested_attributes_for :items

  scope :unconfirmed, where(:confirmed => false)
  
  def confirm!
    return false if self.confirmed
    return false if self.scrap_tool_parts.empty?
    return false if self.scrap_tool_parts.group_by(&:tool_material).any? do |material, parts| 
      material.stocking_info.nil? || material.stocking_info.current_quantity.nil? || material.stocking_info.current_quantity < parts.size
    end
    ActiveRecord::Base.transaction do
      self.scrap_tool_parts.group_by(&:tool_material).each do |material, parts|
        material.stocking_info.current_quantity -= scrap_tool_parts.size
      end
      current_date = Date.current
      self.items.each do |item|
        item.build_replace_tool_part(
          :category => item.scrap_tool_part.tool_material.category,
          :sub_category => item.scrap_tool_part.tool_material.sub_category,
          :actual_quantity => 0,
          :actual_sharpen_time => 0,
          :effective_date => current_date,
          :expected_quantity => item.scrap_tool_part.tool_material.technical_info.expected_quantity,
          :expected_sharpen_time => item.scrap_tool_part.tool_material.technical_info.sharpen_time,
          :model => item.scrap_tool_part.tool_material.model,
          :part_no => item.scrap_tool_part.part_no,
          :in_service => true
        )
        item.scrap_tool_part.tool_material.serving_parts << item.replace_tool_part
        item.scrap_tool_part.assembly_tool_item.serving_parts << item.replace_tool_part
        item.scrap_tool_part.in_service = false
        item.scrap_tool_part.expired_date = current_date
      end
      self.confirmed = true
      self.save
    end
    true
  end

  def to_str
    "#{assembly_tool} #{doc_date} #{items.size}"
  end
  alias to_label to_str
  alias to_s to_str
end
