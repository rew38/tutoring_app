class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :hometown
      t.string :course
      t.string :travel_school
      t.string  :password_digest
      t.timestamps
    end
  end
end
