class ProductsInvoice < ActiveRecord::Base
  attr_accessible :count , :product_id
  belongs_to :product
  belongs_to :invoice
end
