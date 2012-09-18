class Member < ActiveRecord::Base
  attr_accessible :address, :comercial_key, :email, :name_member, :phone, :rfc, :social_reason
  has_many :customers
  has_many :clients, through: :customers
  has_many :products
  has_many :invoices
  #Validaciones
  validates :email,
  :presence  => true,	
  :uniqueness => true,
  :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } 
  validates :address, :comercial_key, :name_member, :phone, :rfc, :social_reason,
  :presence => true

end
