class SchedulesController < ApplicationController
	
	
	before_filter :authenticate_user! 
	
	def index	
		@user = User.find(params[:user_id])
		@schedules = @user.schedules
	end

end
