class CreateStudentClassrooms < ActiveRecord::Migration
  def change
    create_table :student_classrooms, :id => false do |t|

      t.integer :student_id
      t.integer :classroom_id
      t.integer :teacher_id
      t.timestamps null: false
    end
  end
end
