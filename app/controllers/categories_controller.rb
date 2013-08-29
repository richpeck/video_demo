class CategoriesController < ApplicationController

	def update
		@user = User.find(params[:user_id])
		
		@user.categories << Category.find(params[:id])
		@user.save
		
		redirect_to users_path
	end
	
	def destroy 
		user = User.find(params[:user_id])
		category = Category.find(params[:id])
		user.categories.delete(category)
		
		redirect_to users_path
	end

	
end
