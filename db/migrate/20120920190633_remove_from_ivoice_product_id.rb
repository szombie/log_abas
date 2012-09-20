class RemoveFromIvoiceProductId < ActiveRecord::Migration
  def up
  	remove_column :invoices, :product_id
  end

  def down
  end
end
