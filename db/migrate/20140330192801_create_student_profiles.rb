class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string :students_school
      t.integer :class_of
      t.integer :student_id
      t.timestamps
    end
  end
end
