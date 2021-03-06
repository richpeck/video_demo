class MembersController < ApplicationController

	def index
		@members = User.includes(:role).where(:roles_users => {role_id: '2'})
	end

	def show 
		@members = User.includes(:role, :categories).where(:roles_users => {role_id: '2'}, :categories_users => {category_id: params[:id]})
		render :index
	end
	
end
