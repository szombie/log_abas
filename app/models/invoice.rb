class Invoice < ActiveRecord::Base
  attr_accessible :iva, :totalfinal, :folio, :status, :total ,:client_id, :member_id, :products_invoice_attributes   
  belongs_to :member
  belongs_to :client
  has_many :products_invoice
  has_many :products , through: :products_invoice , dependent: :destroy
  accepts_nested_attributes_for :products_invoice , allow_destroy: true
  validates :client_id,:folio, :member_id,
  :presence => true

end
