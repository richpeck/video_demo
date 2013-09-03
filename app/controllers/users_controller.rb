class UsersController < ApplicationController

	before_filter :authenticate_user!, :except => ['show']

	def index
		@user = User.find(current_user.id)
		@credits = @user.credits.sum('value')
		@role = @user.role
		@profile = @user.profile
		@broadcasts = @user.broadcasts.reject {|a| a.id == "" }
		@portfolio = @user.portfolios
		@schedules = @user.schedules
		
		@new_broadcast = @user.broadcasts.new
		@new_categories = Category.all - @user.categories
		
	end
	
	def show
		@user = User.find(params[:id])
		@profile = @user.profile
		@broadcasts = @user.broadcasts
		@portfolio = @user.portfolios
	end

end
