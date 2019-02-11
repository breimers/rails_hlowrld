class SessionsController < ApplicationController
  
  
  before_action :authenticate_user, :only => [:home, :profile, :setting]
  before_action :save_login_state, :only => [:login, :login_attempt]

  def login
  end

  def logout
	  session[:user_id] = nil
	  redirect_to :action => 'login'
  end

  def login_attempt
	  authorized_user = User.authenticate(params[:username],params[:login_password])
	  if authorized_user
		  session[:user_id] = authorized_user.id
		  flash[:notice] = "ohh, it's just #{authorized_user.username}, come in."
		  redirect_to(:action => 'home')
	  else
		  flash[:notice] = "who tf are you? sign up or leave."
		  flash[:color] = "invalid"
		  render "login"
	  end
  end

  def home
  end

  def profile
  end

  def setting
  end
end
