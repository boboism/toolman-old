class AssemblyTool < ActiveRecord::Base
  belongs_to :product_line
  belongs_to :facility_type
  belongs_to :facility_code
  belongs_to :workshop_process
  attr_accessible :blade_quantity, :feed_speed, :first_velocity, :hilt_no, :max_diameter, :max_velocity, :processing_hole, :processing_position, :rpm, :standard_setting_time, :tool_part_quantity
end
