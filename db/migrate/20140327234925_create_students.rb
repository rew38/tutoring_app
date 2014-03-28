class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :students_school
      t.integer :class_of
      t.string  :password_digest
      t.timestamps
    end
  end
end
