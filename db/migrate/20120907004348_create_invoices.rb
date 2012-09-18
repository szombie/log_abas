class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :folio
      t.integer :member_id
      t.integer :client_id
      t.float :total
      t.string :status

      t.timestamps
    end
  end
end
