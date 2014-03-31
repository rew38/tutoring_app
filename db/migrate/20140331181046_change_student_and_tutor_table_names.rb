class ChangeStudentAndTutorTableNames < ActiveRecord::Migration
  def change
    rename_table :student_profiles, :students
    rename_table :tutor_profiles, :tutors
  end
end
