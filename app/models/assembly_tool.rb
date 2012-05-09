class AssemblyTool < ActiveRecord::Base
  belongs_to :product_line
  belongs_to :facility_type
  belongs_to :facility_code
  belongs_to :workshop_process
  has_many :assembly_tool_engine_model_ships
  has_many :engine_models, through: :assembly_tool_engine_model_ships
  has_many :assembly_tool_items

  attr_accessible :blade_quantity, :feed_speed, :first_velocity, :hilt_no, :max_diameter, :max_velocity, :processing_hole, :processing_position, :rpm, :standard_setting_time, :tool_part_quantity, :product_line_id, :facility_type_id, :facility_code_id, :workshop_process_id, :engine_model_ids, :assembly_tool_items_attributes

  accepts_nested_attributes_for :assembly_tool_items, allow_destroy: true, reject_if: :all_blank
end
