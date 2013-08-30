class CategoriesController < ApplicationController

	def update
		@user = User.find(params[:user_id])
		@id = @user.categories.where(:id => params[:id]).present?
		
		if (!@id)
			@user.categories << Category.find(params[:id])
			@user.save
		end
		
		redirect_to users_path
	end
	
	def destroy 
		user = User.find(params[:user_id])
		category = Category.find(params[:id])
		user.categories.delete(category)
		
		redirect_to users_path
	end

	
end
