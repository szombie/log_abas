class AddPresentacionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :presentacion, :string
  end
end
