# students_controller.rb

class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
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
    @student = Student.find(params[:id])
    # Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end


  private

  def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :students_school,
      :class_of,
      :password,
      :password_confirmation
    )
  end

end
