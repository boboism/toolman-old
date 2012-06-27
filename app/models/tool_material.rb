class ToolMaterial < ActiveRecord::Base
  resourcify

  default_value_for :category_id, 1
  default_value_for :sub_category_id, 1
  default_value_for :standardized, true
  default_value_for :service_quantity, 0
  default_value_for :sharpen_part, true

  belongs_to :category
  belongs_to :sub_category
  attr_accessible :model, :service_quantity, :sharpen_part, :standardized, :tool_no, :category_id, :sub_category_id, :technical_info_attributes, :purchase_info_attributes, :stocking_info_attributes, :physical_info_attributes

  has_one :technical_info, :autosave => true, :dependent => :destroy
  has_one :purchase_info, :autosave => true, :dependent => :destroy
  has_one :stocking_info, :autosave => true, :dependent => :destroy
  has_one :physical_info, :autosave => true, :dependent => :destroy
  has_one :barcode, :as => :archivable, :dependent => :destroy
  has_one :qrcode, :as => :archivable, :dependent => :destroy
  has_many :in_service_tool_parts
  has_many :retired_tool_parts
  has_many :serving_parts, :class_name => :ToolPart, :foreign_key => :tool_material_id, :conditions => {:in_service => true}, :autosave => true, :dependent => :destroy
  has_many :retired_parts, :class_name => :ToolPart, :foreign_key => :tool_material_id, :conditions => {:in_service => false}, :autosave => true, :dependent => :destroy

  accepts_nested_attributes_for :technical_info, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :purchase_info, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :stocking_info, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :physical_info, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :in_service_tool_parts, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :serving_parts, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :retired_parts, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :barcode, :allow_destroy => true, :reject_if => :all_blank 
  accepts_nested_attributes_for :qrcode, :allow_destroy => true, :reject_if => :all_blank

  scope :hilts, where(:category_id => 4) #lambda{{:conditions => {:category_id => 4}}}

  def assembled_quantity
    self.in_service_tool_parts.count{ |part| part.in_service? }
  end

  def current_service_quantity
    self.in_service_tool_parts.count
  end
  
  def service_quantity_changed?
    self.in_service_tool_parts.count == self.service_quantity
  end

  def arrange_in_service_tool_parts?
    if not self.service_quantity_changed?
      return true
    end
    if self.assembled_quantity > self.service_quantity
      return false
    end
  end

  def barcode_content
    "#{tool_no}"
  end
  alias qrcode_content barcode_content

  def mass_create_serving_parts?
    self.serving_parts.empty?
  end

  def mass_create_serving_parts
    ActiveRecord::Base.transaction do
      self.service_quantity.times{ |index| append_serving_part(index+1) } if serving_parts.empty?
      self.save
    end
    self
  end

  def append_serving_part(index = nil)
    index = index || serving_parts.map{ |part| part.tool_no }.max_by{|no| no.last(2).to_i }
    self.serving_parts.build(
      :part_no => "#{self.tool_no}/#{'%02d'%index}",
      :category => self.category,
      :sub_category => self.sub_category,
      :model => self.model,
      :expected_quantity => (self.technical_info.expected_quantity if self.technical_info) || 0,
      :expected_sharpen_time => (self.technical_info.sharpen_time if self.technical_info) || 0,
      :actual_quantity => 0,
      :actual_sharpen_time => 0
    )
  end

  def self.default_xls_options
    tm_class = ToolMaterial.new.class
    ph_class = PhysicalInfo.new.class
    pu_class = PurchaseInfo.new.class
    st_class = StockingInfo.new.class
    te_class = TechnicalInfo.new.class
    {
      :name =>"#{tm_class.model_name.human.singularize}",
      :headers => [
        tm_class.human_attribute_name(:id),
        tm_class.human_attribute_name(:tool_no),
        tm_class.human_attribute_name(:category),
        tm_class.human_attribute_name(:sub_category),
        tm_class.human_attribute_name(:model),
        tm_class.human_attribute_name(:standardized),
        tm_class.human_attribute_name(:service_quantity),
        tm_class.human_attribute_name(:sharpen_part),
        te_class.human_attribute_name(:actual_quantity),
        te_class.human_attribute_name(:expected_quantity),
        te_class.human_attribute_name(:sharpen_time),
        pu_class.human_attribute_name(:purchase_no),
        pu_class.human_attribute_name(:quantity),
        pu_class.human_attribute_name(:unit_price),
        st_class.human_attribute_name(:stock_no),
        st_class.human_attribute_name(:stack_no),
        st_class.human_attribute_name(:max_quantity),
        st_class.human_attribute_name(:min_quantity),
        st_class.human_attribute_name(:current_quantity),
        ph_class.human_attribute_name(:first_diameter),
        ph_class.human_attribute_name(:second_diameter),
        ph_class.human_attribute_name(:hilt_length),
        ph_class.human_attribute_name(:slot_length),
        ph_class.human_attribute_name(:step_length),
        ph_class.human_attribute_name(:gross_length),
  
      ],
      :columns => [
        :id,
        :tool_no,
        'category.name',
        'sub_category.name',
        :model,
        :standardized,
        :service_quantity,
        :sharpen_part,
        'technical_info.actual_quantity',
        'technical_info.expected_quantity',
        'technical_info.sharpen_time',
        'purchase_info.purchase_no',
        'purchase_info.quantity',
        'purchase_info.unit_price',
        'stocking_info.stock_no',
        'stocking_info.stack_no',
        'stocking_info.max_quantity',
        'stocking_info.min_quantity',
        'stocking_info.current_quantity',
        'physical_info.first_diameter',
        'physical_info.second_diameter',
        'physical_info.hilt_length',
        'physical_info.slot_length',
        'physical_info.step_length',
        'physical_info.gross_length',
      ]
    }
  end

  def to_str
    I18n.t("activerecord.attributes.tool_material.record_description",
           :tool_no => self.tool_no,
           :model => self.model)
  end
  alias to_label to_str
  alias to_s to_str
end
