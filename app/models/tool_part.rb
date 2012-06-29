class ToolPart < ActiveRecord::Base

  belongs_to :category
  belongs_to :sub_category
  belongs_to :tool_material, :autosave => true
  attr_accessible :total_sharpen_time, :effective_date, :total_process_quantity, :expired_date, :model, :part_no, :type, :is_active, :tool_material_id, :sub_category_id, :category_id

  has_one :scrap_order_item, :class_name => :ScrapOrderItem, :foreign_key => :scrap_tool_part_id
  has_one :scrap_order, :through => :scrap_order_item
  has_one :scrap_assembly_tool, :through => :scrap_order, :source => :assembly_tool
  has_one :barcode, :as => :archivable, :dependent => :destroy
  has_one :qrcode, :as => :archivable, :dependent => :destroy

  has_many :combination_tool_items
  has_many :combination_tool_items_issued, :class_name => :CombinationToolItem, :conditions => { :stock_status => CombinationTool::STOCK_STATUS_ISSUE }
  accepts_nested_attributes_for :barcode, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :qrcode, :allow_destroy => true, :reject_if => :all_blank

  scope :active, where(:is_active => true)
  scope :not_active, where(:is_active => false)

  def self.scrapable(param = {})
    assembly_tool = param[:assembly_tool]
    p = ToolPart.arel_table
    query = p[:is_active].eq(true)
    query = query.or(p[:assembly_tool_item_id].in(assembly_tool.item_ids)) if assembly_tool
    where(query)
  end

  def self.retired
    where(:is_active => false)
  end

  def self.is_active
    where(:is_active => true)
  end

  def self.available(tp = {})
    assembly_tool = tp[:assembly_tool]
    assembly_tool_item = tp[:assembly_tool_item]
    tool_material = tp[:tool_material]

    assembly_tool_item_ids = [nil]
    assembly_tool_item_ids << assembly_tool_item.id if assembly_tool_item
    assembly_tool_item_ids << assembly_tool.items.map{|item| item.id} if assembly_tool
    tool_material = assembly_tool_item.tool_material if tool_material.nil? && assembly_tool_item
    is_active
      .where(:conditions => {
        :tool_parts => {
          :assembly_tool_item_id => assembly_tool_item_ids
        }
      })
  end

  def retired!
    is_active = false
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
