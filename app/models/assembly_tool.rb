class AssemblyTool < ActiveRecord::Base

  default_value_for :product_line_id, 1
  default_value_for :facility_type_id, 1
  default_value_for :facility_code_id, 1
  default_value_for :workshop_process_id, 1
  default_value_for :setting_device_id, 1
  default_value_for :setting_type_id, 1
  default_value_for :assembled, false
  default_value_for :confirmed, false
  default_value_for :stock_status, 'I'

  belongs_to :product_line
  belongs_to :facility_type
  belongs_to :facility_code
  belongs_to :workshop_process
  belongs_to :setting_device
  belongs_to :setting_type
  has_many :assembly_tool_engine_model_ships
  has_many :engine_models, :through => :assembly_tool_engine_model_ships
  has_many :items, :class_name => :AssemblyToolItem
  has_many :serving_parts, :class_name => :ToolPart, :through => :items
  has_many :service_stock_orders, :class_name => :ServiceStockOrder, :autosave => true

  attr_accessible :assembled, :blade_quantity, :feed_speed, :first_velocity, :hilt_no, :max_diameter, :max_velocity, :processing_hole, :processing_position, :rpm, :standard_setting_time, :tool_part_quantity, :product_line_id, :facility_type_id, :facility_code_id, :workshop_process_id, :engine_model_ids, :setting_device_id, :setting_type_id, :items_attributes, :confirmed, :stock_status

  accepts_nested_attributes_for :items, :allow_destroy => true, :reject_if => :all_blank
  
  def to_str
    "#{workshop_process} #{hilt_no}"
  end
  alias to_label to_str
  alias to_s to_str

  scope :assembled, where(:assembled => true)
  scope :confirmed, where(:confirmed => true)
  scope :stocked_in, where(:stock_status => 'I')
  scope :stocked_out, where(:stock_status => 'O')

  def in_stock?
    self.stock_status == 'I'
  end

  def stock_in
    self.stock_status = 'I' if self.not_in_stock?
  end

  def not_in_stock?
    !in_stock?
  end

  def stock_out
    self.stock_status = 'O' if self.in_stock?
  end

  def self.carded
    confirmed
    .includes(:product_line, 
              :facility_type, 
              :facility_code, 
              :workshop_process, 
              :setting_device,
              :engine_models,
              :items,
              :serving_parts)
  end

  def self.search(params = {})
    t = AssemblyTool.arel_table
    list = confirmed
    search_params = nil
    params.each do |key, value|
      key = key.to_sym if key.is_a? String
      if value.is_a? Numeric or value.is_a? TrueClass or value.is_a? FalseClass
        search_params = search_params ? search_params.or(t[key].eq(value)) : t[key].eq(value)
      elsif value.is_a? Symbol or value !~ /(^%|%$)/i
        search_params = search_params ? search_params.or(t[key].eq(value.to_s)) : t[key].eq(value.to_s)
      elsif value =~ /^[0-9]+(.[0-9]{2})?$/i
        search_params = search_params ? search_params.or(t[key].eq(value.to_f)) : t[key].eq(value.to_f)
      elsif value =~ /^(true|false)$/i
        search_params = search_params ? search_params.or(t[key].eq('true' == value)) : t[key].eq('true' == value)
      else
        search_params = search_params ? search_params.or(t[key].matches("#{value}")) : t[key].matches("#{value}")
      end
    end
    search_params ? list.where(search_params) : list
  end

  def confirm!
    ActiveRecord::Base.transaction do
      self.assembled = self.items.all? { |item| item.assembled }
      self.confirmed = true if self.assembled
      self.save
    end
  end
end
