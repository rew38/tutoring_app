class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    @tutors = Tutor.all
    @students = Student.all

    if student_logged_in?
      @students_appointments = Appointment.find_all_by_student_id(current_student.id.to_s)
      elsif tutor_logged_in?
      @tutors_appointments = Appointment.find_all_by_tutor_id(current_tutor.id.to_s)
      elsif admin_logged_in?
      @appointments = Appointment.all
      @tutors = Tutor.all
      @students = Student.all
    end
  end
    # @tutors = Tutor.all
    # @students = Student.all

    # @appointment = Appointment.find(@appointments[:id])

    #  @tutor = Tutor.find(@appointment[:tutor_id])
    # @student = Student.find(@appointment[:student_id])


 def new

  if tutor_logged_in?
    @appointment = Appointment.new
    @tutors = Tutor.all
    @students = Student.all

    @tutors_appointments = Appointment.find_all_by_tutor_id(current_tutor.id.to_s)
  else
    @appointment = Appointment.new
    @tutors = Tutor.all
    @students = Student.all
  end
 end


  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      if student_logged_in?
        redirect_to("/students")
      elsif tutor_logged_in?
        redirect_to("/tutors")
      else
        redirect_to("/admins")
      end
    else
      # render the new.html.erb file with @user
      render :new
    end
  end


  def edit
        @appointment = Appointment.find(params[:id])
        @tutors = Tutor.all
        @students = Student.all
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      if student_logged_in?
        redirect_to("/students")
      elsif tutor_logged_in?
        redirect_to("/tutors")
      else
        redirect_to("/admins")
      end
    else
      render :edit
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    # @tutor = Tutor.find(@appointment[:tutor_id])
    # @student = Student.find(@appointment[:student_id])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    if student_logged_in?
        redirect_to("/students")
      elsif tutor_logged_in?
        redirect_to("/tutors")
      else
        redirect_to("/")
      end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :tutor_id, :student_id, :location)
  end

end





