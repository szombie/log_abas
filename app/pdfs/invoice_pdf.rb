class InvoicePdf < Prawn::Document
  def initialize(invoices,members,total_facturas,fecha_ini,fecha_fin)
    super(top_margin: 70)
    @invoices = invoices
    @members = members
    @total_facturas = total_facturas
    @fecha_ini = fecha_ini
    @fecha_fin = fecha_fin
    repeat(:all, :dynamic => true) do
    header
    end
    if @fecha_ini == @fecha_fin
     reporte_diario(@members,@total_facturas)
   else
     reporte_dinamico(@members,@total_facturas,@fecha_ini,@fecha_fin)
    end
  end

  def header
    logo
    text_box "Facturas Emitidas", size: 12, style: :bold, at: [200, 750]
    move_down 5
    text_box "#{@fecha_ini} | #{@fecha_fin}", size: 12, style: :bold, at: [190, 730]  
  	text_box "#{Date.today}", size: 10, style: :bold, at: [485, 750]
    text_box "#{Time.now.strftime("%I:%M%p")}", size: 10, style: :bold, at: [486, 740]
    draw_text page_number, :at => [485, 720], size: 10, style: :bold
    move_down 8
    stroke_horizontal_rule
    pad_top(20){ 
    text_box "Folio                 Fecha                  Socio Comercial           Cliente           Total          Estado",size: 12, style: :bold, :at => [20, 670]
    }
    stroke_horizontal_rule
   end

   def line_items(id_miembro) 
    font_size 10
    table header_tablas(id_miembro) , :width => 500, :cell_style => {:padding => [0, 0, 0, 30],:border_width => 0}
  end

  def header_tablas(id_miembro)    
    @invoices.miembro(id_miembro).map do |item| 
      [item.folio, item.fecha, item.member.name_member, item.client.name_client,item.total,item.status]
   		end
  end

  def logo
  logopath =  "#{Rails.root}/app/assets/images/abastos.png"
  image logopath ,  at: [0, 750]
end
  
  def reporte_diario members , total_facturas
  members.each_with_index do |m,i|
    unless m.invoices.diarias.empty? 
        #text "#{m.name_member}", size: 20, style: :bold
        line_items(m.id)
        text "#{m.name_member} : $#{total_facturas[i]}", size: 15 , style: :bold 
      end
    end
  end

  def reporte_dinamico members , total_facturas,fecha_inicio,fecha_fin
  members.each_with_index do |m,i|
    unless m.invoices.nuevas_inicio(fecha_inicio).nuevas_fin(fecha_fin).empty?
        #text "#{m.name_member}", size: 20, style: :bold
        line_items(m.id)
        text "#{m.name_member} : $#{total_facturas[i]}", size: 15 , style: :bold 
      end
    end
  end

end