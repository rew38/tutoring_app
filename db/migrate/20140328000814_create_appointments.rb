class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :start_time
      t.string :end_time
      t.string :tutor_id
      t.string :student_id
      t.string :location
      t.timestamps
    end
  end
end
