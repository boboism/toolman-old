class TunningWorkOrder < ActiveRecord::Base
  resourcify

  default_value_for :confirmed, false
  default_value_for :doc_date, Date.current

  belongs_to :assembly_tool
  belongs_to :doc_user, :class_name => :User, :foreign_key => :doc_user_id
  has_one :setting_item, :class_name => :TunningWorkOrderSettingItem, :autosave => true
  has_many :sharpen_items, :class_name => :TunningWorkOrderSharpenItem, :autosave => true
  attr_accessible :doc_date, :doc_user_id, :assembly_tool_id, :setting_item_attributes, :sharpen_items_attributes, :confirmed

  accepts_nested_attributes_for :setting_item, :sharpen_items
  
  after_initialize :init

  scope :unconfirmed, where(:confirmed => false)
  scope :confirmed, where(:confirmeed => true)

  def completed?
    !setting_item.nil?
  end
  
  def confirm!
    if !confirmed && !setting_item.nil? && !sharpen_items.empty?
      self.confirmed = true
      sharpen_items.each do |item|
        if item.actual_time > 0
          item.tool_part.actual_sharpen_time += 1
          item.tool_part.actual_quantity += item.actual_quantity
        end
      end
      return true
    end
    return false
  end

  def to_str
    "#{doc_date} #{assembly_tool}"
  end
  alias to_label to_str
  alias to_s to_str

  protected

  def init
    self.confirmed ||= false
    self.doc_date ||= Date.current
  end

end
