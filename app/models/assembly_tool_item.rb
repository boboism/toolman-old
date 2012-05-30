class AssemblyToolItem < ActiveRecord::Base
  default_value_for :uom, I18n.t('activerecord.attributes.assembly_tool_item.uom_default')
  belongs_to :assembly_tool
  belongs_to :tool_material
  belongs_to :sharpen_device
  has_many :serving_parts, :class_name => :ToolPart, :conditions => {:in_service => true}
  attr_accessible :quantity, :standard_sharpen_time, :uom, :assembled, :tool_material_id, :assembly_tool_id, :sharpen_device_id, :serving_part_ids
  accepts_nested_attributes_for :serving_parts

  def assembled?
    quantity == serving_parts.size
  end

  def self.assembled
    joins{serving_parts}.group{~id}.having{{serving_parts: {count(id).eq => ~quantity}}}
  end

  def to_str
    I18n.t('activerecord.attributes.assembly_tool_item.item_description',
           :quantity => quantity,
           :uom => uom,
           :name => tool_material)
  end
  alias to_label to_str
  alias to_s to_str
end
