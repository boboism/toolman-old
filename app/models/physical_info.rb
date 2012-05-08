class PhysicalInfo < ActiveRecord::Base
  belongs_to :tool_material
  attr_accessible :first_diameter, :gross_length, :hilt_length, :second_diameter, :slot_length, :step_length
end
