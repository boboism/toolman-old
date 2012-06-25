class AssemblyToolItemObserver < ActiveRecord::Observer
  def before_save(item)
    #judge_assembled(item)

    item
  end

  protected

  def judge_assembled(item)
    item.assembled = item.serving_parts ? item.serving_parts.size == item.quantity : false
    item.assembly_tool.assembled = item.assembly_tool.items.all? { |item| item.assembled }
  end
end
