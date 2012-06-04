module TunningWorkOrdersHelper
  def set_up_tunning_work_order(tunning_work_order)
    if not tunning_work_order.assembly_tool.nil?
      assembly_tool = tunning_work_order.assembly_tool
      tunning_work_order.build_setting_item unless tunning_work_order.setting_item
      tunning_work_order.setting_item.setting_type = assembly_tool.setting_type
      tunning_work_order.setting_item.setting_device = assembly_tool.setting_device
      tunning_work_order.setting_item.expected_time = assembly_tool.standard_setting_time
      tunning_work_order.setting_item.actual_time = assembly_tool.standard_setting_time
      tunning_work_order.setting_item.operator = tunning_work_order.doc_user
      if tunning_work_order.sharpen_items.empty?
        assembly_tool.items.each do |item|
          item.serving_parts.each do |part|
            spitem = tunning_work_order.sharpen_items.build
            spitem.tool_part = part
            spitem.sharpen_device = item.sharpen_device
            spitem.expected_quantity = part.expected_quantity
            spitem.expected_time = part.expected_sharpen_time
            spitem.actual_quantity = 0
            spitem.actual_time = 0
            spitem.operator = tunning_work_order.doc_user
          end
        end
      end
    end

    tunning_work_order
  end
end
