class DailyReport < ActiveRecord::Base
  attr_accessible :fecha, :invoice_id
  has_many :invoices
  
end
