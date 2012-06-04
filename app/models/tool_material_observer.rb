class ToolMaterialObserver < ActiveRecord::Observer
  observe :tool_material

  def before_validation(record)
    make_change_to_serving_parts(record)

    record
  end

  protected

  def make_change_to_serving_parts(record)
    return unless record.is_a? ToolMaterial
    record.serving_parts.each do |part|
      nos = part.part_no.split('/')
      nos[0] = record.model
      part.part_no = nos.join('/')
    end
  end
end
