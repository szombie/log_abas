class Product < ActiveRecord::Base
  attr_accessible :description, :key, :peso, :product_name , :member_id, :presentacion  
  validates :description,:key, :product_name, :presentacion,
  :presence => true
  belongs_to :member
  has_many :products_invoice
  has_many :invoices , through: :products_invoice
end
