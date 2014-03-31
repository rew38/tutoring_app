# tutor.rb
# app/models/tutor.rb
class Tutor < User
  has_one :tutor_profile
  accepts_nested_attributes_for :tutor_profile

end
