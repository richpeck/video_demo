class Credit < ActiveRecord::Base
	belongs_to :user, :class_name => 'User', :foreign_key => 'id'
end
