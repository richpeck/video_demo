class PortfolioController < ApplicationController
	
	before_filter :authenticate_user!
	
	def create
		@portfolio = Portfolio.new(upload_params)
		@portfolio.save
		
		respond_to do |format|
			format.html { render :nothing => true }
			format.js	{
				@user = User.find(current_user.id)
				@portfolio_count = @user.portfolios.count()
				render :partial => 'portfolio/create.js', :locals => { :image_url => @portfolio.cover_image_url, :id => @portfolio.id, :items => @portfolio_count }, :methods => [:cover_image_url]
			}
			format.json {
				@url = portfolio_path(@portfolio.id)
				render :json => {:url => @url, :items => @portfolios_count, :portfolio => @portfolio.as_json(:only => [:id, :name, :description], :methods => [:cover_image_url])}
			}
		end
	end
	
	def destroy
		@portfolio = Portfolio.find(params[:id])
		@portfolio.destroy
		
		respond_to do |format|
			format.html { redirect_to users_path }
			format.json {
				@items = Portfolio.where("user_id = ?", current_user.id).count()
				render :json => {:items =>  @items}
			}
		end
	end
	
	private
	def upload_params
		params.require(:new_portfolio).permit(:description, :cover_image).merge(:user_id => current_user.id)
	end
	
end
