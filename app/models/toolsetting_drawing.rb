class ToolsettingDrawing < ArchiveFile
  belongs_to :assembly_tool
  attr_accessible :file_suffix, :name, :size, :url
end
