class Users::RegistrationsController < Devise::RegistrationsController
	include DeviseHelper

	def create
		sign_up_prms = sign_up_params.merge!({full_name: params[:user][:full_name],password_confirmation: params[:user][:password]})
		build_resource(sign_up_prms)
		resource.save
		yield resource if block_given?
		if resource.persisted?
			if resource.active_for_authentication?
				sign_in(resource_name, resource) 
				redirect_to root_path
			else
				set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
				expire_data_after_sign_in!
				respond_with resource, location: after_inactive_sign_up_path_for(resource)
			end
		else
			flash[:errors] = resource.errors.full_messages
			@email = params[:user][:email] if params[:user][:email].present?
			clean_up_passwords resource
			set_minimum_password_length
			respond_with resource
		end
	end

	
	def sign_up_params
		devise_parameter_sanitizer.sanitize(:sign_up)
	end

end