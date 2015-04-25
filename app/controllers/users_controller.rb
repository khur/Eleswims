class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
   
    if @user == current_user
       @user.destroy
      session.delete(:user_id)
      redirect_to users_path
    else
       @user.destroy
      redirect_to users_path
    end
  
  end

  private
  def user_params
  params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :administrator )
  end
end
