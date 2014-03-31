# tutor.rb
# app/models/tutor.rb
class Tutor < ActiveRecord::Base
  belongs_to :user
  # accepts_nested_attributes_for :tutor_profile

end
