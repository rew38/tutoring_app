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


  private

  def tutor_params
    params.require(:tutor).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :hometown,

      :password,
      :password_confirmation
    )
  end

end
