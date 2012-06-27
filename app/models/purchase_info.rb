class PurchaseInfo < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :agency
  belongs_to :tool_material
  attr_accessible :purchase_no, :quantity, :unit_price, :manufacturer_id, :agency_id
end
