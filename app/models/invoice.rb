class Invoice < ActiveRecord::Base
  attr_accessible :iva, :totalfinal, :folio, :status, :total ,:client_id, :member_id, :fecha ,  :products_invoice_attributes   
  belongs_to :member
  belongs_to :client
  belongs_to :daily_report
  has_many :products_invoice
  has_many :products , through: :products_invoice , dependent: :destroy
  accepts_nested_attributes_for :products_invoice , allow_destroy: true
  validates :client_id,:folio, :member_id,
  :presence => true

  scope :nuevas  , order('created_at desc')
  scope :diarias , where(fecha: Date.today.to_s)
  scope :miembro, lambda { |id| where(member_id:id) }
end
