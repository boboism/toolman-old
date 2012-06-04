class ServiceStockOrder < ActiveRecord::Base
  default_value_for :io, 'I'

  belongs_to :assembly_tool
  belongs_to :doc_user, :class_name => :User, :foreign_key => :doc_user_id
  belongs_to :operator, :class_name => :User, :foreign_key => :operator_id
  attr_accessible :doc_date, :doc_user_id, :io, :operator_id, :assembly_tool_id, :doc_user, :operator, :assembly_tool, :operation_date
  scope :stock_in, where(:io => 'I')
  scope :stock_out, where(:io => 'O')

  accepts_nested_attributes_for :assembly_tool

  def stock_in_order?
    io == 'I'
  end

  def stock_out_order?
    !stock_in_order?
  end

  def process_stock
    stock_in or stock_out
  end

  def stock_in
    if stock_in_order? and self.assembly_tool.not_in_stock?
      ActiveRecord::Base.transaction do
        self.assembly_tool.stock_in
        self.save
      end
      return true
    else
      return false
    end
  end

  def stock_out
    if stock_out_order? and self.assembly_tool.in_stock?
      ActiveRecord::Base.transaction do
        self.assembly_tool.stock_out
        self.save
      end
      return true
    else
      return false
    end
  end

end
