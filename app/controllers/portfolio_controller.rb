class PortfolioController < ApplicationController
	
	before_filter :authenticate_user!
	
	def create
		@portfolio = Portfolio.new(upload_params)
		@portfolio.save
		redirect_to users_path
	end
	
	def destroy
		@portfolio = Portfolio.find(params[:id])
		@portfolio.destroy
		redirect_to users_path
	end
	
	private
	def upload_params
		params.require(:new_portfolio).permit(:description, :cover_image).merge(:user_id => current_user.id)
	end
	
end
