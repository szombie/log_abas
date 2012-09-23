class AddFechaToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :fecha, :date
  end
end
