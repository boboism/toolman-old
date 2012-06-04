class ToolPart < ActiveRecord::Base
  default_value_for :in_service, true

  belongs_to :category
  belongs_to :sub_category
  belongs_to :tool_material, :autosave => true
  belongs_to :assembly_tool_item, :include => :assembly_tool
  belongs_to :assembly_tool
  attr_accessible :actual_quantity, :actual_sharpen_time, :effective_date, :expected_quantity, :expected_sharpen_time, :expired_date, :model, :part_no, :type, :in_service, :tool_material_id, :sub_category, :category

  has_one :scrap_order_item, :class_name => :ScrapOrderItem, :foreign_key => :scrap_tool_part_id
  has_one :scrap_order, :through => :scrap_order_item
  has_one :scrap_assembly_tool, :through => :scrap_order, :source => :assembly_tool
  has_one :barcode, :as => :archivable, :dependent => :destroy
  has_one :qrcode, :as => :archivable, :dependent => :destroy

  accepts_nested_attributes_for :barcode, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :qrcode, :allow_destroy => true, :reject_if => :all_blank


  def self.scrapable(param = {})
    assembly_tool = param[:assembly_tool]
    p = ToolPart.arel_table
    query = p[:in_service].eq(true)
    query = query.or(p[:assembly_tool_item_id].in(assembly_tool.item_ids)) if assembly_tool
    where(query)
  end

  def self.retired
    where(:in_service => false)
  end

  def self.in_service
    where(:in_service => true)
  end

  def self.available(tp = {})
    assembly_tool = tp[:assembly_tool]
    assembly_tool_item = tp[:assembly_tool_item]
    tool_material = tp[:tool_material]

    assembly_tool_item_ids = [nil]
    assembly_tool_item_ids << assembly_tool_item.id if assembly_tool_item
    assembly_tool_item_ids << assembly_tool.items.map{|item| item.id} if assembly_tool
    tool_material = assembly_tool_item.tool_material if tool_material.nil? && assembly_tool_item
    in_service
      .where(:conditions => {
        :tool_parts => {
          :assembly_tool_item_id => assembly_tool_item_ids
        }
      })
  end

  def retired!
    in_service = false
    self
  end

  def barcode_content
    "#{part_no}"
  end
  alias qrcode_content barcode_content

  def to_str
    I18n.t("activerecord.attributes.tool_part.record_description",
           :part_no => part_no
          )
  end
  alias to_label to_str
  alias to_s to_str
end
