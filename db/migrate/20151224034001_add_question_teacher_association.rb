class AddQuestionTeacherAssociation < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.belongs_to :teacher, index: true
    end
  end
end
