class AssemblyToolEngineModelShip < ActiveRecord::Base
  belongs_to :assembly_tool
  belongs_to :engine_model
  # attr_accessible :title, :body
end
