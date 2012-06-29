class CombinationTool < ActiveRecord::Base
  STOCK_STATUS_ISSUE = 'O'
  STOCK_STATUS_RECEIVE = 'I'

  belongs_to :assembly_tool
  belongs_to :stock_in_operator, :class_name => :User
  belongs_to :stock_out_operator, :class_name => :User

  has_many :items, :class_name => :CombinationToolItem

  attr_accessible :stock_in_date, :stock_in_operator_id, :stock_out_date, :stock_out_operator_id, :stock_status, :assembly_tool_id, :hilt_no, :hilt_no_seq

  scope :issued, where(:stock_status => STOCK_STATUS_ISSUE)
  scope :received, where(:stock_status => STOCK_STATUS_RECEIVE)

  def setup_for_issue_with_hilt_no(params = {})
    return if params[:hilt_no].blank? || params[:hilt_no_seq].blank?
    self.hilt_no, self.hilt_no_seq = params[:hilt_no], params[:hilt_no_seq]
    self.assembly_tool = AssemblyTool.confirmed.find_by_hilt_no(hilt_no)
    self.stock_status = STOCK_STATUS_ISSUE
    self.assembly_tool.items.each do |ass_item|
      ass_item.quantity.times do 
        self.items.build(:tool_material_id => ass_item.tool_material.id,
                         :stock_status => STOCK_STATUS_ISSUE)
      end if ass_item.quantity > 0
    end if assembly_tool
  end
end
