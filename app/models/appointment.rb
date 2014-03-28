class Appointment < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :student




  validates(:start_time,  { :presence => true } )
  validates(:end_time, { :presence => true } )
  validates(:location,  { :presence => true } )

end
