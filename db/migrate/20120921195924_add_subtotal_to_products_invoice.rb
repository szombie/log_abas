class AddSubtotalToProductsInvoice < ActiveRecord::Migration
  def change
    add_column :products_invoices, :subtotal, :float
  end
end
