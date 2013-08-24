module ApplicationHelper

	#Returns Current Class for Nav Menu
	def active_class?(path)
	  "current" if current_page?(path)
	end
	
	#Returns name or email if name not present
	def name?(user)
		if (!user.profile.name) 
			user.email 
		else
			user.profile.name
		end
	end

end
