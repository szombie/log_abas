class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :key
      t.text :description
      t.float :precio
      t.float :peso

      t.timestamps
    end
  end
end
