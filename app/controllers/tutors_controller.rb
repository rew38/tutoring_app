class TutorsController < ApplicationController

  def index
    @tutors = Tutor.all
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end

  def edit
    @tutor = Tutor.find(params[:id])
    # Tutor.find_by(id: params[:id])
  end

  def update
    @tutor = Tutor.find(params[:id])

    if @tutor.update(tutor_params)
      redirect_to tutor_path(@tutor)
    else
      render :edit
    end
  end

  def show
    @tutor = Tutor.find(params[:id])
    @tutor_profile  = @tutor.tutor_profile
  end

  def destroy
    @tutor = Tutor.find(params[:id])
    @tutor.destroy
    session[:user_id] = nil
    redirect_to root_path
  end


  private

  def tutor_params
    params[:tutor].permit(:name, :email, :phone_number, :password, :password_confirmation, :tutor_profile_attributes => [:hometown, :tutors_school, :tutors_course])
  end

end
