class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name_client
      t.boolean :status
      t.text :address
      t.string :rfc
      t.string :social_rease
      t.text :fiscal_address
      t.string :phone
      t.string :email
      t.string :zone

      t.timestamps
    end
  end
end
