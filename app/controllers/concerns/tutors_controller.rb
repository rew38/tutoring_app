# tutors_controller.rb

class TutorsController < ApplicationController

  def new
    @tutor = Tutor.new
  end
end
