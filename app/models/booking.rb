class Booking < ActiveRecord::Base

	belongs_to :user, :class_name => 'User'
	has_and_belongs_to_many :schedules, :class_name => 'Schedule'
	
end
