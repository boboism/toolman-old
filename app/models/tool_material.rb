class ToolMaterial < ActiveRecord::Base
  belongs_to :category
  belongs_to :sub_category
  attr_accessible :model, :service_quantity, :sharpen_part, :standardized, :tool_no, :category_id, :sub_category_id, :technical_info_attributes, :purchase_info_attributes, :stocking_info_attributes, :physical_info_attributes

  has_one :technical_info
  has_one :purchase_info
  has_one :stocking_info
  has_one :physical_info

  accepts_nested_attributes_for :technical_info, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :purchase_info, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :stocking_info, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :physical_info, allow_destroy: true, reject_if: :all_blank
end
