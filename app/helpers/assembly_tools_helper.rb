module AssemblyToolsHelper
  def setup_assembly_tool(assembly_tool)
    5.times { assembly_tool.assembly_tool_items.build }
    assembly_tool
  end

  def li_engine_models(assembly_tool)
    assembly_tool.engine_models.map{|eng| "<li>#{eng.to_label}</li>"}.join
  end
end
