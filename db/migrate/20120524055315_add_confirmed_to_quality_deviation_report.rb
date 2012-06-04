class AddConfirmedToQualityDeviationReport < ActiveRecord::Migration
  def change
    add_column :quality_deviation_reports, :confirmed, :boolean
    add_index :quality_deviation_reports, :confirmed
  end
end
