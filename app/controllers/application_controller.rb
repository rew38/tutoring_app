class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success

  layout :render_layout

    def current_student
      @student_user ||= Student.find_by(id: session[:user_id])
    end
    helper_method :current_student

    def current_tutor
       @tutor_user ||= Tutor.find_by(id: session[:user_id])
    end
    helper_method :current_tutor

    def student_logged_in?
      current_student.present?
    end

    def tutor_logged_in?
      current_tutor.present?
    end

    def render_layout
      if current_student
        "student"
      elsif current_tutor
        "tutor"
      end
    end

  helper_method :student_logged_in?
  helper_method :tutor_logged_in?

end
