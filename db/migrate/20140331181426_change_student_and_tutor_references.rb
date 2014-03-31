class ChangeStudentAndTutorReferences < ActiveRecord::Migration
  def change
    rename_column :students, :student_id, :user_id
    rename_column :tutors, :tutor_id, :user_id
  end
end
