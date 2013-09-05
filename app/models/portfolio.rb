class Portfolio < ActiveRecord::Base

	self.table_name = 'portfolio'
	belongs_to :user, :class_name => 'User'
	
	has_attached_file :cover_image,
		:storage => :s3,
		:bucket => 'video-conference-demo',
		:default_url => "/images/missing.png"
		:url => ":s3_eu_url"
	
	def cover_image_url
        cover_image.url(:original)
    end

end
