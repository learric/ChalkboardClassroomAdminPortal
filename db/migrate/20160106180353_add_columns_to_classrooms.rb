class AddColumnsToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :teacher_id, :integer
    add_column :classrooms, :student_id, :integer
  end
end
