class InvoicePdf < Prawn::Document
  def initialize(invoices,members,total_facturas)
    super(top_margin: 70)
    @invoices = invoices
    @members = members
    @total_facturas = total_facturas
    fecha_reporte
    @members.each_with_index do |m,i|
      move_down 20
      text "#{m.name_member}", size: 20, style: :bold
      line_items(m.id)
      move_down 10
      text "#{m.name_member} : $#{@total_facturas[i]}", size: 15 , style: :bold 
    end
  end

  def fecha_reporte
  	text "Reporte de facturas emitidas  #{Date.today}", size: 20, style: :bold
  end

   def line_items(id_miembro)
    move_down 20 
    table header_tablas(id_miembro)
  end

  def header_tablas(id_miembro)
    [["Folio", "Fecha", "Socio Comercial", "Cliente","Total", "Estado"]] +
    @invoices.miembro(id_miembro).map do |item| 
      [item.folio, item.fecha, item.member.name_member, item.client.name_client,item.total,item.status]
   		end
  end

end