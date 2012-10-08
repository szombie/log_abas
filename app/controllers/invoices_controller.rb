class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.nuevas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    @subtotals = producto_subtotal(params[:id])
    @cantidades = producto_cantidad(params[:id])
    @precio_unitario = precio_unitario(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    @invoice.products_invoice.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Factura creada correctamente.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Factura actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  def diarias
    @invoices = Invoice.diarias
    @members = Member.all
    @total_facturas = total_facturas(@members)
    respond_to do |format|
      format.html 
      format.pdf do
        pdf = InvoicePdf.new(@invoices, @members,@total_facturas,Date.today)
        send_data pdf.render, filename: "ReporteDiario_#{Date.today}",
                            type: "application/pdf",
                            disposition: "inline"
      end
    end
  end

  def reporte_dinamico
    @invoices = Invoice.nuevas_inicio(params[:fecha_Inicial]).nuevas_fin(params[:fecha_Final])
    session[:fecha_ini] = params[:fecha_Inicial]
    session[:fecha_fin] = params[:fecha_Final]
    respond_to do |format|
    if @invoices.empty?
     format.html
   else
    format.html { redirect_to action: "show_reporte_dinamico" }
  end
end
end

  def show_reporte_dinamico
   @invoices = Invoice.nuevas_inicio(session[:fecha_ini]).nuevas_fin(session[:fecha_fin])
   @members = Member.all
   @total_facturas = dinamico_total_facturas(@members,session[:fecha_ini],session[:fecha_fin])
   respond_to do |format|
      format.html
   format.pdf do
        pdf = InvoicePdf.new(@invoices, @members,@total_facturas,session[:fecha_ini],session[:fecha_fin])
        send_data pdf.render, filename: "Reporte_#{Date.today}",
                            type: "application/pdf",
                            disposition: "inline"
      end
    end

  end


  private

  def producto_subtotal invoice_id
    a = Invoice.find(invoice_id)
    c = a.products_invoice
    d = []
    c.each_with_index do |p , i|
      d[i] = p.subtotal
    end 
    return d  
  end

  def producto_cantidad invoice_id
    a = Invoice.find(invoice_id)
    c = a.products_invoice
    d = []
    c.each_with_index do |p , i|
      d[i] = p.count
    end 
    return d  
  end

  def precio_unitario invoice_id
    a = Invoice.find(invoice_id)
    c = a.products_invoice
    d = []
    c.each_with_index do |p , i|
      d[i] = p.price
    end 
    return d  
  end

  def total_facturas member
    d =[]
    member.each_with_index do |m , i|
    a = Invoice.miembro(m.id).diarias
    c = 0 
    a.each do |fac|
      c = c + fac.total
    end 
    d[i] = c
  end
    return d
  end  

  def dinamico_total_facturas member, fecha_inicio, fecha_fin
    d =[]
    member.each_with_index do |m , i|
    a = Invoice.miembro(m.id).nuevas_inicio(fecha_inicio).nuevas_fin(fecha_fin)
    c = 0 
    a.each do |fac|
      c = c + fac.total
    end 
    d[i] = c
  end
    return d
  end


end
