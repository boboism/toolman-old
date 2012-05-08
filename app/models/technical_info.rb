class TechnicalInfo < ActiveRecord::Base
  belongs_to :tool_material
  attr_accessible :actual_length, :actual_quantity, :expected_length, :expected_quantity, :sharpen_time
end
