class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    @tutor = Tutor.find(params[:appointment][:tutor_id])
    @student = Student.find(params[:appointment][:student_id])
  end

 def new
    @appointment = Appointment.new
    @tutors = Tutor.all
    @students = Student.all

 end


  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end


  def edit

  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @tutor = Tutor.find(params[:tutor_id])
    @student = Student.find(params[:student_id])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :tutor_id, :student_id, :location)
  end

end





