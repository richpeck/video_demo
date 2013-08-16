class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		 
   has_and_belongs_to_many :roles
   
   before_create :role_detect
   
   private
   def role_detect
		if defined?(self.role)
		
			case self.role
			when admin
				self.admin = 1
			when member 
				self.member = 1
			when user
				self.user = 1			
			else
				self.user = 1
			end
			
		else
			self.user = 1
		end
   end
   
end
