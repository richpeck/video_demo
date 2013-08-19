module ApplicationHelper

	#Returns Current Class for Nav Menu
	def active_class?(path)
	  "current" if current_page?(path)
	end

end
