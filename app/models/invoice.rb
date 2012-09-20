class Invoice < ActiveRecord::Base
  attr_accessible :client_id, :folio, :member_id, :status, :total , :products_invoice_attributes   
  belongs_to :member
  belongs_to :client
  has_many :products_invoice
  has_many :products , through: :products_invoice
  accepts_nested_attributes_for :products_invoice
end
