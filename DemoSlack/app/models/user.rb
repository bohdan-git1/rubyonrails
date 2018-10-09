class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	validate :validate_password, :validate_name
  	
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    def validate_password
	    if ["password","123456", "abcdef"].include?(self.password) 
	      errors.add(:password, "is not valid!")
	    end
  	end

  	def validate_name
  		if self.full_name.blank?
  			errors.add(:Name, "can't be blank")
  		end	
  	end
end
