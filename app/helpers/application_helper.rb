module ApplicationHelper
	def active_menu(controller)
	"active" if  params[:controller] == controller
	end 
	def lateral_menu(link,path,id)
	link_to  raw("#{link} <b class='caret'></b>" ), path , class: 'dropdown-toggle', data:{ :toggle => 'dropdown' }, id: "#{id}"	
	end
	def drop_menu(link,path)
	link_to  raw("#{link}"), path , tabindex: '-1'

	end
end
