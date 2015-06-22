class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    #uses "find_by_id" cause it's ok to return nil
    #User.find throws an exception if the user can't be found
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_authentication_token(cookies[:auth_token]) if
        cookies[:auth_token] && @current_user.nil?
    @current_user
  end

  def authenticate_user
    if current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to :root
    end
  end


  def authenticate_admin
    if current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to :root
    else
      if !current_user.is_admin
        flash[:error] = "You don't have privileges to view this page."
      end
    end
  end

  end
