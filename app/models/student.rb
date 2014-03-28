class Student < ActiveRecord::Base
  has_secure_password

  has_many :tutors, :through => :appointments
  has_many :appointments

  validates(:first_name,  { :presence => true } )
  validates(:last_name, { :presence => true } )
  validates(:email,  { :presence => true })
  validates(:phone_number,  { :presence => true } )
  validates(:students_school,  { :presence => true } )
  validates(:class_of,  { :presence => true } )

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  validates(:email,    { :uniqueness   => { case_sensitive: false }})

  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end

end
