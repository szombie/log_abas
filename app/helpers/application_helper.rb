module ApplicationHelper
	def active_menu(controller)
	"active" if  params[:controller] == controller
	end 
	def lateral_menu(link,path,id)
	link_to  raw("#{link} <b class='caret'></b>" ), path , class: 'dropdown-toggle', data:{ :toggle => 'dropdown' }, id: "#{id}"	
	end
	def drop_menu(link,path)
		link_to  raw("#{link}"), path, tabindex: '-1'
	end

	def factura_drop_menu(link,path,opt)
	link_to  raw("#{link}"), {controller: "/invoices",class: "btn", action: 'new', opt: opt}, tabindex: '-1'
	end

	def link_to_add_fields(name, f, association,clase)
	    new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s.singularize + "_fields", f: builder)
	    end
	    link_to(name, '#', class: "add_fields #{clase} ", data: {id: id, fields: fields.gsub("\n", "")})
	end 
	def fecha
		Date.today
	end

	def fecha_orden
		Date.today.strftime("%d-%m-%Y")
	end

	def autocomplete_clientes(id_member) 
		h = []
		Customer.find(:all,:conditions => {member_id: id_member },select: "client_code").each { |c| h.push("#{c.client_code}")}
		Member.find(id_member).clients.each { |c| h.push("#{c.name_client}")}
		return h
	end

	def autocomplete_productos(id_member)
		h = [] 
		Product.find(:all,:conditions => {member_id: id_member }, select:"product_name,key").each { |p| h.push("#{p.product_name}")}
		Product.find(:all,:conditions => {member_id: id_member }, select:"key").each { |p| h.push("#{p.key}")}
	
		return h 
	end

	def convierte_fecha(fecha)
		fecha.to_date
	end	

end
