class User < ActiveRecord::Base
  has_one :student
  has_one :tutor
  has_secure_password

end
