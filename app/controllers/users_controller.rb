# users_controller.rb

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
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end



  private

  def user_params
    params[:user].permit(:name, :email, :phone_number, :type, :password, :password_confirmation)
  end

end
