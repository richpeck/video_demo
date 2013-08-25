class SchedulesController < ApplicationController
	
	before_filter :authenticate_user!
	
	def index	
		@user = User.find(params[:user_id])
		@schedules = @user.schedules
	end
	
	def create
		@new_schedule = Schedule.new(schedule_params)
		@new_schedule.save
		redirect_to profile_path
	end
	
	private
	def schedule_params
		params.require(:new_schedule).permit(:start, :end).merge(:user_id => current_user.id)
	end

end
