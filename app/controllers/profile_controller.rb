class ProfileController < ApplicationController

	before_filter :authenticate_user!

	def update
		@profile = User.joins(:profile).find(current_user.id)
		@profile.profile.update(upload_params)
		redirect_to users_path
	end
	
	private
	def upload_params
		params.require(:upload).permit(:avatar)
	end

end
