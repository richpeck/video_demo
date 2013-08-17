class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :user_credits
  
  private
  def user_credits
	  if user_signed_in?
		@user = User.find(current_user.id)
		@credits_balance = @user.credits.sum('value')
	  end
  end
  
end
