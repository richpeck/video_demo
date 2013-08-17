class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		 
   has_and_belongs_to_many :role, :class_name => 'Role'
   has_many :credits, :class_name => 'Credit', :foreign_key => 'user_id'
   has_one :profile, :class_name => 'Profile', :foreign_key => 'user_id'
   
   before_create :role_detect
   
   private
   def role_detect
		if self.role.blank?
			self.role = 3
		end
   end
   
end
