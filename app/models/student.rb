# student.rb
# app/models/student.rb
class Student < ActiveRecord::Base
  belongs_to :user
  # accepts_nested_attributes_for :student_proefile
end
