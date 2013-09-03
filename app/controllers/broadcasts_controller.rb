class BroadcastsController < ApplicationController

	before_filter :config_opentok,:except => [:index]
	before_filter :authenticate_user!
		
	def show 
		@broadcast = Broadcast.find(params[:id])
		@tok_token = @opentok.generate_token :session_id => @broadcast.sessionId  

	end
	
	def create
		session = @opentok.create_session request.remote_addr
		params[:broadcast][:sessionId] = session.session_id

		@new_broadcast = Broadcast.new(permit_params)

		respond_to do |format|
			if @new_broadcast.save
				format.html { redirect_to("/broadcasts/"+@new_broadcast.id.to_s) }
				format.js   { render :partial => 'elements/modals/ajax_complete', :locals =>  { msg: "Broadcast Created!" } }
			else
				format.html { render :controller => 'users', :action => "index" }
				format.js   { render :partial => 'elements/modals/ajax_complete', :locals =>  { msg: "Sorry, there was an error! Please try again!", form: "elements/modals/new_broadcast"} }
			end
		end
	end

	private
	def permit_params
		params.require(:broadcast).permit(:name, :description, :public, :sessionId).merge(:user_id => current_user.id)
	end
	
	
	private
	def config_opentok
		if @opentok.nil?
			@opentok = OpenTok::OpenTokSDK.new 38223312, "4171d6cefebe8bf60e631160972078ef7fb05eb4"
		end
	end


end
