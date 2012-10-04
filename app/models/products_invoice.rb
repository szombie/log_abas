class ProductsInvoice < ActiveRecord::Base
  attr_accessible :count , :product_id, :subtotal , :invoice_id , :price
  belongs_to :product
  belongs_to :invoice
   validates :count,:product_id, :price ,
  :presence => true

  before_save :calculates_subtotal
  after_save :calculate_total
#Saca el subtotal de cada precio
  def calculates_subtotal
  	self.subtotal = self.price * self.count	
  end
  
#Calcula el total de toda la factura ademas de sacar el Iva y sumarselo al total final
   def calculate_total 
     prices = ProductsInvoice.find_all_by_invoice_id(self.invoice_id)
     total = 0 
     iva = 0
     totalfinal = 0
    prices.each do |price|
      total += price.subtotal
    end
    iva = total * 0.0
    totalfinal = iva + total
    fac = Invoice.find(self.invoice_id)
    fac.update_attributes(total: total , iva:  iva , totalfinal: totalfinal )


  end

  
end
