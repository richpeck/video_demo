class BookingsController < ApplicationController
	
	def create
		@booking = Booking.new(booking_params)
		@booking.save
		
		redirect_to user_path(params[:user_id])
	end
	
	private 
	def booking_params
		params.permit(:user_id)
	end

end
