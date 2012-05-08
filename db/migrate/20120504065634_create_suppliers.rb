class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :type
      t.string :name
      t.string :company_name
      t.string :address
      t.string :postbox
      t.string :tel
      t.string :linkman
      t.string :website

      t.timestamps
    end
    add_index :suppliers, :type
    add_index :suppliers, :name
  end
end
