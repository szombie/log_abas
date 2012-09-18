class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name_member
      t.string :social_reason
      t.text :address
      t.string :rfc
      t.string :comercial_key
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
