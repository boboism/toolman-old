module ScrapOrdersHelper
  def set_up_scrap_order(scrap_order)
    if scrap_order.assembly_tool
      scrap_order.assembly_tool.serving_parts.each do |part|
        scrap_order.items.build(:scrap_tool_part => part)
      end
    end

    scrap_order
  end
end
