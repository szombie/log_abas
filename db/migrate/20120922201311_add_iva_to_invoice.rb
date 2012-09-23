class AddIvaToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :iva, :float
  end
end
