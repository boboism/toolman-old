module ToolMaterialsHelper
  def setup_tool_material(tool_material)
    tool_material.build_technical_info unless tool_material.technical_info
    tool_material.build_purchase_info unless tool_material.purchase_info
    tool_material.build_stocking_info unless tool_material.stocking_info
    tool_material.build_physical_info unless tool_material.physical_info
    tool_material
  end
end
