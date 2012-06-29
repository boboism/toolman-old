class AssemblyToolItem < ActiveRecord::Base
  belongs_to :assembly_tool
  belongs_to :tool_material
  belongs_to :sharpen_device
  attr_accessible :quantity, :sharpen_time, :tool_material_id, :assembly_tool_id, :sharpen_device_id
  
  def to_str
    I18n.t('activerecord.attributes.assembly_tool_item.item_description',
           :quantity => quantity,
           :name => tool_material)
  end
  alias to_label to_str
  alias to_s to_str
end
