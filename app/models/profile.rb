class Profile < ActiveRecord::Base
	
	has_one :user, :class_name => 'User', :foreign_key => 'user_id'
	has_attached_file :avatar, :default_url => "/images/missing.png"

	
end
