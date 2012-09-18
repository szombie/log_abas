class AddProductIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :product_id, :integer
  end
end
