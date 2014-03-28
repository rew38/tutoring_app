class Tutor < ActiveRecord::Base
  has_secure_password

  has_many :students, :through => :appointments
  has_many :appointments

  validates(:first_name,  { :presence => true } )
  validates(:last_name, { :presence => true } )
  validates(:email,  { :presence => true } )
  validates(:phone_number,  { :presence => true } )
  validates(:hometown,  { :presence => true } )

  validates(:email,    { :uniqueness   => { case_sensitive: false }})

  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end
end
