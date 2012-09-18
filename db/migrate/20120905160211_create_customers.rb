class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :client_id
      t.integer :member_id
      t.string :client_code

      t.timestamps
    end
  end
end
