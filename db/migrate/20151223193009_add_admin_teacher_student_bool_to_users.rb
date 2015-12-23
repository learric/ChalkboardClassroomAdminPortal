class AddAdminTeacherStudentBoolToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_teacher, :boolean, default: false
    add_column :users, :is_student, :boolean, default: false
  end
end
