class HomeController < ApplicationController

	before_action :authenticate_user!, except: [:index,:get_started] 

	def index
		
	end

	def index_new
		
	end

	def get_started
		if params[:email].present?
			if !User.find_by(email: params[:email]).present? 
				redirect_to new_user_registration_path(:email => params[:email]) 
			else
				flash[:alert] = "Email already registerd!"
				redirect_to root_path
			end
		else 
			flash[:alert] = "Please enter an email address"
			redirect_to root_path	
		end		
	end
end
