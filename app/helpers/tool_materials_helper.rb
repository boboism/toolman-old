module ToolMaterialsHelper
  def setup_tool_material(tool_material)
    tool_material.category_id = 1
    tool_material.sub_category_id = 1
    tool_material.is_standard = true
    tool_material.is_sharpen_part = true
    tool_material.service_quantity = true

    tool_material.build_technical_info unless tool_material.technical_info
    tool_material.build_purchase_info unless tool_material.purchase_info
    tool_material.build_stocking_info unless tool_material.stocking_info
    tool_material.build_physical_info unless tool_material.physical_info
    
    tool_material
  end
end
