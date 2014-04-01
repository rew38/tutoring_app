# students_controller.rb

class StudentsController < ApplicationController

  def index
    @students = Student.all

  end

 def new
   @student = Student.new
   @student.build_student_profile
 end


  def create
    @student = Student.new(student_params)


    if @student.save
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end

  def edit
    @student = Student.includes(:student_profile).find(params[:id])
    @student.build_student_profile unless @student.student_profile # build a new profile, if there is no current student profile
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
    params.require(:student).permit(:name, :email, :phone_number, :password, :password_confirmation, :student_profile_attributes => [:students_school, :class_of])
  end

end
