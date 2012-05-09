class EngineModel < ActiveRecord::Base
  attr_accessible :description, :name

  def to_label
    "#{self.name} #{self.description}"
  end
end
