class CreateTutorProfiles < ActiveRecord::Migration
  def change
    create_table :tutor_profiles do |t|
      t.string :hometown
      t.string :tutors_school
      t.string :tutors_course
      t.integer :tutor_id
      t.timestamps
    end
  end
end
