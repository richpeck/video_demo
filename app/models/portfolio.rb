class Portfolio < ActiveRecord::Base

	self.table_name = 'portfolio'
	belongs_to :user, :class_name => 'User'
	
	has_attached_file :cover_image,
		:default_url => "/images/missing.png"

	
	def cover_image_url
        cover_image.url(:original)
    end

end
