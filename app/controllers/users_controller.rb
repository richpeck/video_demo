class UsersController < ApplicationController

	def index
		@user = User.find(current_user.id)
		@credits = @user.credits.sum('value')
		@role = @user.role
		
		@profile = @user.profile
	end

end
