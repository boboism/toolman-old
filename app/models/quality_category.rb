class QualityCategory < ActiveRecord::Base
  default_value_for :quality_type, '1'
  attr_accessible :description, :name, :quality_type

  def self.quality_type_selection
    [
      [I18n.t('activerecord.attributes.quality_category.types.1'), '1'],
      [I18n.t('activerecord.attributes.quality_category.types.2'), '2'],
      [I18n.t('activerecord.attributes.quality_category.types.3'), '3'],
      [I18n.t('activerecord.attributes.quality_category.types.4'), '4'],
      [I18n.t('activerecord.attributes.quality_category.types.5'), '5'],
      [I18n.t('activerecord.attributes.quality_category.types.6'), '6'],
    ]
  end

  def to_str
    "#{name}"
  end
  alias to_label to_str
  alias to_s to_str
end
