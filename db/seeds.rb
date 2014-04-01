User.delete_all
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

raph = Student.create(name: "raph", email: "raph@raph.com", phone_number: "212 767 9318", password: "raph", password_confirmation: "raph")
profile = StudentProfile.create(students_school: "GTOWN", class_of: 2012)

raph.student_profile = profile

phil = Tutor.create(name: "phil", email: "phil@phil.com", phone_number: "212 767 9318", password: "phil", password_confirmation: "phil")
profile = TutorProfile.create(hometown: "Dover", tutors_school: "GA", tutors_course: "Ruby on Rails")

phil.tutor_profile = profile
