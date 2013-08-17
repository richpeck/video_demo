class MembersController < ApplicationController

	def index
		@members = User.includes(:role).where(:roles_users => {role_id: '2'})
	end

	
end
