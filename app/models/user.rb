class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		 
   has_and_belongs_to_many :role, :class_name => 'Role'
   has_one :profile, :class_name => 'Profile', :foreign_key => 'user_id'
   has_many :credits, :class_name => 'Credit', :foreign_key => 'user_id'
   has_and_belongs_to_many :categories, :class_name => 'Category'
   has_many :broadcasts, :class_name => 'Broadcast', :foreign_key => 'user_id'
   has_many :portfolios, :class_name => 'Portfolio', :foreign_key => 'user_id'
   has_many :schedules, :class_name => 'Schedule', :foreign_key => 'user_id'
   has_many :bookings, :class_name => 'Booking'
   
   before_create :role_detect
   before_create :profile_detect
   
   private
   def role_detect
		if self.role.blank?
			self.role << Role.find('3')
		end
   end
   
   private 
   def profile_detect
		build_profile 
   end

   
end
