class EngineModel < ActiveRecord::Base
  attr_accessible :description, :name

  def to_str
    "#{self.name} #{self.description}"
  end
  alias to_label to_str
  alias to_s to_str
end
