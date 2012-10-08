class Invoice < ActiveRecord::Base
  attr_accessible :iva, :totalfinal, :folio, :status, :total ,:client_id, :member_id, :fecha ,  :products_invoice_attributes   
  belongs_to :member
  belongs_to :client
  has_many :products_invoice
  has_many :products , through: :products_invoice , dependent: :destroy
  accepts_nested_attributes_for :products_invoice , allow_destroy: true
  validates_presence_of :client_id,:folio, :member_id

  scope :nuevas  , order('created_at desc')
  scope :diarias , where(fecha: Date.today.to_s)
  scope :miembro, lambda { |id| where(member_id:id) }
  scope :nuevas_inicio, lambda { |f_ini| where('fecha >= ?',f_ini )}
  scope :nuevas_fin, lambda { |f_fin| where('fecha <= ?',f_fin )}
end
