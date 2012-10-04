class AddPriceToProductsInvoice < ActiveRecord::Migration
  def change
    add_column :products_invoices, :price, :float
  end
end
