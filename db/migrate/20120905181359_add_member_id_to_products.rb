class AddMemberIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :member_id, :integer
  end
end
