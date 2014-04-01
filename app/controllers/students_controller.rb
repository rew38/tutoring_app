# students_controller.rb

class StudentsController < ApplicationController

  def index
    @students = Student.all

  end

  def new
    @student = Student.new
  end

  def create
    binding.pry


    @student = Student.new(student_params)
    @profile = StudentProfile.new(student_params)

    @student.student_profile = @profile


    if @student.save
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
    # Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

def show
  @student = Student.find(params[:id])
  @student_profile  = @student.student_profile

end

def destroy
  @student = Student.find(params[:id])
  @student.destroy
  session[:user_id] = nil
  redirect_to root_path
end

  private

  def student_params
    params[:student].permit(:name, :email, :phone_number, :password, :password_confirmation, :student_profile_attributes => [:students_school, :class_of])
  end

end
