class ProfileController < ApplicationController

	before_filter :authenticate_user!

	def update
		@profile = User.find(current_user.id)
		@profile.profile.update(upload_params)
		
		respond_to do |format|
			format.html { render :nothing => true }
			format.js 	{ render :partial => 'profiles/update.js' }
			format.json { 
				render :json => @profile.profile.as_json(:only => [:id, :avatar], :methods => [:avatar_url])
			}
		end
	end
	
	private
	def upload_params
		params.require(:upload).permit(:avatar, :public, :description)
	end

end
