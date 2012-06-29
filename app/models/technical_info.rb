class TechnicalInfo < ActiveRecord::Base
  belongs_to :tool_material

  attr_accessible :perform_quantity, :sharpen_time
end
