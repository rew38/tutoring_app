User.delete_all
Appointment.delete_all
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

raph = Student.create(name: "raph", email: "raph@raph.com", phone_number: "212 767 9318", password: "raph", password_confirmation: "raph")
profile = StudentProfile.create(students_school: "GA", class_of: 2012)

raph.student_profile = profile

nick = Student.create(name: "nick", email: "nick@nick.com", phone_number: "917 333 8172", password: "nick", password_confirmation: "nick")
profile = StudentProfile.create(students_school: "UMass", class_of: 1956)

nick.student_profile = profile


phil = Tutor.create(name: "phil", email: "phil@phil.com", phone_number: "435 237 0192", password: "phil", password_confirmation: "phil")
profile = TutorProfile.create(hometown: "Dover", tutors_school: "GA", tutors_course: "Ruby on Rails")

phil.tutor_profile = profile



max = Tutor.create(name: "max", email: "max@max.com", phone_number: "646 345 9334", password: "max", password_confirmation: "max")
profile = TutorProfile.create(hometown: "Brooklyn", tutors_school: "NYU", tutors_course: "Intro to GitHub")

max.tutor_profile = profile

david = Tutor.create(name: "david", email: "david@david.com", phone_number: "917 903 6467", password: "david", password_confirmation: "david")
profile = TutorProfile.create(hometown: "TBD", tutors_school: "GA", tutors_course: "Intro to GitHub")

david.tutor_profile = profile



admin = Admin.create(name: "admin", email: "admin@admin.com", password: "admin", password_confirmation: "admin")
