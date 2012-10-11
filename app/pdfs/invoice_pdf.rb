class InvoicePdf < Prawn::Document
  def initialize(invoices,members,total_facturas,fecha_ini,fecha_fin)
    super(top_margin: 70)
    @invoices = invoices
    @members = members
    @total_facturas = total_facturas
    @fecha_ini = fecha_ini
    @fecha_fin = fecha_fin
    logo
    fecha_reporte
    if @fecha_ini == @fecha_fin
     reporte_diario(@members,@total_facturas)
   else
     reporte_dinamico(@members,@total_facturas,@fecha_ini,@fecha_fin)
    end
  end

  def fecha_reporte
    text "Reporte de Facturas Emitidas #{@fecha_ini} | #{@fecha_fin}", size: 12, style: :bold
     move_down 5  
  	text "Expedido: #{Date.today}", size: 10, style: :bold
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

  def logo
  logopath =  "#{Rails.root}/app/assets/images/abastos.png"
  image logopath ,  at: [450, 700]
end
  
  def reporte_diario members , total_facturas
  members.each_with_index do |m,i|
    unless m.invoices.diarias.empty?
        move_down 20
        text "#{m.name_member}", size: 20, style: :bold
        line_items(m.id)
        move_down 10
        text "#{m.name_member} : $#{total_facturas[i]}", size: 15 , style: :bold 
      end
    end
  end

  def reporte_dinamico members , total_facturas,fecha_inicio,fecha_fin
  members.each_with_index do |m,i|
    unless m.invoices.nuevas_inicio(fecha_inicio).nuevas_fin(fecha_fin).empty?
        move_down 20
        text "#{m.name_member}", size: 20, style: :bold
        line_items(m.id)
        move_down 10
        text "#{m.name_member} : $#{total_facturas[i]}", size: 15 , style: :bold 
      end
    end
  end

end