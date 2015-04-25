class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  include SessionsHelper

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
      unless logged_in?
        flash[:error] = "Log in/Sign up to do that!"
        redirect_to login_path
      end
    end

    def authorized? 
      unless current_user.administrator == true || current_user == User.find(params[:id]) 
        flash[:error] = "That ain't you!"
        redirect_to users_path
      end
    end

end
