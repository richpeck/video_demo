class UsersController < ApplicationController

	before_filter :authenticate_user!, :except => ['show']

	def index
		@user = User.find(current_user.id)
		@credits = @user.credits.sum('value')
		@role = @user.role
		@profile = @user.profile
		@videos = @user.videos
		@portfolio = @user.portfolios
		@new_video = @user.videos.new
	end
	
	def show
		@user = User.find(params[:id])
		@profile = @user.profile
		@videos = @user.videos
		@portfolio = @user.portfolios
	end

end
