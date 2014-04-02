# admins_controller.rb


class AdminsController < ApplicationController

 def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
    @admins = Admin.all

  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end


end
