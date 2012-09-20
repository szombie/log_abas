class AddCountToProductsInvoice < ActiveRecord::Migration
  def change
    add_column :products_invoices, :count, :integer
  end
end
