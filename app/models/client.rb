class Client < ActiveRecord::Base
  attr_accessible :address, :email, :fiscal_address, :name_client, :phone, :rfc, :social_rease, :status, :zone
  has_many :customers
  has_many :members, through: :customers
  has_many :invoices
 #Validaciones
  validates :email,
  :presence  => true,	
  :uniqueness => true,
  :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :address,:fiscal_address, :name_client, :phone, :rfc, :social_rease, :status, :zone,
  :presence => true
    
end
