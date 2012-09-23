class AddTotalFinalToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :totalfinal, :float
  end
end
