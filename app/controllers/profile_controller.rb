class ProfileController < ApplicationController

	def update
		@profile = Profile.find(params[:id])
		@profile.update(upload_params)
		redirect_to root_path
	end
	
	private
	def upload_params
		params.require(:upload).permit(:avatar)
	end

end
