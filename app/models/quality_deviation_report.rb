class QualityDeviationReport < ActiveRecord::Base
  default_value_for :category_1_id, 1
  default_value_for :category_2_id, 2
  default_value_for :category_3_id, 3
  default_value_for :category_4_id, 4
  default_value_for :category_5_id, 5
  default_value_for :category_6_id, 6
  default_value_for :stocking_quantity, 0
  default_value_for :bad_quantity, 0
  default_value_for :confirmed, false

  belongs_to :category_1, :class_name => :QualityCategory, :conditions => {:quality_type => '1'}
  belongs_to :category_2, :class_name => :QualityCategory, :conditions => {:quality_type => '2'}
  belongs_to :category_3, :class_name => :QualityCategory, :conditions => {:quality_type => '3'}
  belongs_to :category_4, :class_name => :QualityCategory, :conditions => {:quality_type => '4'}
  belongs_to :category_5, :class_name => :QualityCategory, :conditions => {:quality_type => '5'}
  belongs_to :category_6, :class_name => :QualityCategory, :conditions => {:quality_type => '6'}
  belongs_to :doc_user, :class_name => :User
  belongs_to :assembly_tool
  attr_accessible :assembly_tool_id, :bad_quantity, :category_1_id, :category_2_id, :category_3_id, :category_4_id, :category_5_id, :category_6_id, :doc_date, :doc_no, :doc_user_id, :doc_user_type, :happen_end_team, :happen_end_time, :happen_start_team, :happen_start_time, :reason, :reason_type, :solution, :stocking_quantity, :suggestion, :title

  scope :unconfirmed, where(:confirmed => false)

  def confirm!
    return false if self.confirmed
    self.confirmed = true
    self.save
  end

end
