class Supplier < ActiveRecord::Base
  attr_accessible :address, :company_name, :linkman, :name, :postbox, :tel, :type, :website
end
