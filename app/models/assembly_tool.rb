class AssemblyTool < ActiveRecord::Base

  default_value_for :product_line_id, 1
  default_value_for :facility_type_id, 1
  default_value_for :facility_code_id, 1
  default_value_for :workshop_process_id, 1
  default_value_for :setting_device_id, 1
  default_value_for :setting_type_id, 1
  default_value_for :assembled, false
  default_value_for :confirmed, false

  belongs_to :product_line
  belongs_to :facility_type
  belongs_to :facility_code
  belongs_to :workshop_process
  belongs_to :setting_device
  belongs_to :setting_type
  has_many :assembly_tool_engine_model_ships
  has_many :engine_models, :through => :assembly_tool_engine_model_ships
  has_many :items, :class_name => :AssemblyToolItem
  has_many :serving_parts, :class_name => :ToolPart, :through => :items
  attr_accessible :assembled, :blade_quantity, :feed_speed, :first_velocity, :hilt_no, :max_diameter, :max_velocity, :processing_hole, :processing_position, :rpm, :standard_setting_time, :tool_part_quantity, :product_line_id, :facility_type_id, :facility_code_id, :workshop_process_id, :engine_model_ids, :setting_device_id, :setting_type_id, :items_attributes, :confirmed

  accepts_nested_attributes_for :items, :allow_destroy => true, :reject_if => :all_blank
  
  def to_str
    "#{workshop_process} #{hilt_no}"
  end
  alias to_label to_str
  alias to_s to_str

  scope :assembled, where(:assembled => true)
  scope :confirmed, where(:confirmed => true)

  def self.carded
    confirmed
    .includes(:product_line, 
              :facility_type, 
              :facility_code, 
              :workshop_process, 
              :setting_device,
              :engine_models,
              :items,
              :serving_parts)
  end

  def confirm!
    ActiveRecord::Base.transaction do
      self.assembled = self.items.all? { |item| item.assembled }
      self.confirmed = true if self.assembled
      self.save
    end
  end
end
