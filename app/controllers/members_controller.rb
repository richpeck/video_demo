class MembersController < ApplicationController

	def index
		@members = User.where(member: '1')
	end
	
end
