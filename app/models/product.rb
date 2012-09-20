class Product < ActiveRecord::Base
  attr_accessible :description, :key, :peso, :precio, :product_name , :member_id	  
  validates :description,:key, :precio, :product_name,
  :presence => true
  belongs_to :member
  has_many :products_invoice
  has_many :invoices , through: :products_invoice
end
