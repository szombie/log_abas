class CreateProductsInvoices < ActiveRecord::Migration
  def change
    create_table :products_invoices do |t|
      t.integer :product_id
      t.integer :invoice_id

      t.timestamps
    end
  end
end
