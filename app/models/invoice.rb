class Invoice < ActiveRecord::Base
  attr_accessible :client_id, :folio, :member_id, :status, :total , :product_ids 
  belongs_to :member
  belongs_to :client
  has_many :products_invoice
  has_many :products , through: :products_invoice

end
