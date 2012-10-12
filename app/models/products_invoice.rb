class ProductsInvoice < ActiveRecord::Base
  attr_accessible :product , :count , :product_id, :subtotal , :invoice_id , :price, :product_attributes
  belongs_to :product
  belongs_to :invoice
   validates :count,:product_id, :price ,
  :presence => true
  accepts_nested_attributes_for :product
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
    if fac.fecha.nil?
    fac.update_attributes(total: total , iva:  iva , totalfinal: totalfinal, fecha: Date.today  )
    else
    fac.update_attributes(total: total , iva:  iva , totalfinal: totalfinal )
    end  
  end

  def product
    p = Product.find(self.product_id).key || Product.find(self.product_id).product_name unless self.product_id.nil?
  end

  def product=(code)
    p = Product.find_by_key(code) || Product.find_by_product_name(code)
    self.product_id = p.id 
  end

  
end
