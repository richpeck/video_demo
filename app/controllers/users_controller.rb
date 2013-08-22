class UsersController < ApplicationController

	def index
		@user = User.find(current_user.id)
		@credits = @user.credits.sum('value')
		@role = @user.role
		
		@profile = @user.profile
		@videos = @user.videos
		@new_video = @user.videos.new
	end
	
	def show
		@user = User.find(params[:id])
		@profile = @user.profile
		@videos = @user.videos
		@portfolio = @user.portfolios
	end

end
