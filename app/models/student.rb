# student.rb
# app/models/student.rb
class Student < User
  has_one :student_profile
  accepts_nested_attributes_for :student_profile
end
