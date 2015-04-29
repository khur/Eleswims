class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:login][:email])
      if user && user.authenticate(params[:login][:password])
        session[:user_id] = user.id.to_s
        # flash[:welcome] = "Thank you for signing in #{current_user.first_name}!"
        redirect_to blogs_path
      else
        flash[:error] = "Email/Password are incorrect!"
        redirect_to login_path
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to login_path
    end
end
