class WorkshopProcess < ActiveRecord::Base
  attr_accessible :description, :name
  
  def to_str
    "#{self.name}"
  end
  alias to_s to_str
  alias to_label to_str
end
