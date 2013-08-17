class ProfileController < ApplicationController

	def update
		@profile = Profile.find(params[:id])
	 
		if @profile.update(upload_params)
			redirect_to users_path
		else
			redirect_to users_path
		end

	end
	
	private
	def upload_params
		params.require(:upload).permit(:avatar)
	end

end
