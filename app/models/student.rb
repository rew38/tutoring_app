class Student < ActiveRecord::Base
  has_secure_password

  has_many :tutors :through => :appointments
  has_many :appointments

  validates(:first_name,  { :presence => true } )
  validates(:last_name, { :presence => true } )
  validates(:email,  { :presence => true } )
  validates(:phone_number,  { :presence => true } )
  validates(:students_school,  { :presence => true } )
  validates(:class_of,  { :presence => true } )

end
