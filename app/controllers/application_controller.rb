class ApplicationController < ActionController::Base
	def authenticate_user
		if session[:user_id]
			@current_user=User.find_session[:user_id]
			return true
		else
			redirect_to(:controller => 'sessions', :action => 'login')
			return false
		end
	end

	def save_login_state
		if session[:user_id]
			redirect_to(:controller => 'sessions', :action => 'home')
			return false
		else
			return true
		end
	end

end
