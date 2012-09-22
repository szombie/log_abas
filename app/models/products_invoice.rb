class ProductsInvoice < ActiveRecord::Base
  attr_accessible :count , :product_id, :subtotal , :invoice_id 
  belongs_to :product
  belongs_to :invoice
   validates :count,:product_id,
  :presence => true

  before_save :calculates_subtotal
  after_save :calculate_total

  def calculates_subtotal
  	precio = Product.find(self.product_id).precio
  	self.subtotal = precio * self.count	
  end
  

   def calculate_total
     prices = ProductsInvoice.find_all_by_invoice_id(self.invoice_id)
     total=0
    prices.each do |price|
      total += price.subtotal
    end
    fac = Invoice.find(self.invoice_id)
    fac.update_attribute(:total , total)
  end

  
end
