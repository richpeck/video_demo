class ProfileController < ApplicationController

	before_filter :authenticate_user!

	def update
		@profile = User.joins(:profile).find(current_user.id)
		@profile.profile.update(upload_params)
		
		respond_to do |format|
			format.html { render :nothing => true }
			format.js 	{ render :partial => 'profiles/update.js' }
		end
	end
	
	private
	def upload_params
		params.require(:upload).permit(:avatar, :public, :description)
	end

end
