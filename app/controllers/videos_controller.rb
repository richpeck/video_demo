class VideosController < ApplicationController

	before_filter :config_opentok,:except => [:index]
	before_filter :authenticate_user!
	

	def index
		@videos = Video.all
		@new_video = Video.new
	end
	
	def show 
		@video = Video.find(params[:id])
		@tok_token = @opentok.generate_token :session_id => @video.sessionId  

	end
	
	def create
		session = @opentok.create_session request.remote_addr
		params[:video][:sessionId] = session.session_id

		@new_video = Video.new(permit_params)

		respond_to do |format|
			if @new_video.save
				format.html { redirect_to("/videos/"+@new_video.id.to_s) }
			else
				format.html { render :controller => 'rooms', :action => "index" }
			end
		end
	end

	private
	def permit_params
		params.require(:video).permit(:name, :description, :public, :sessionId)
	end
	
	
	private
	def config_opentok
		if @opentok.nil?
			@opentok = OpenTok::OpenTokSDK.new 38223312, "4171d6cefebe8bf60e631160972078ef7fb05eb4"
		end
	end


end
