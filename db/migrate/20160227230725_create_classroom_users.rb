class CreateClassroomUsers < ActiveRecord::Migration
  def change
    create_table :classroom_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :classroom, index: true

      t.timestamps null: false
    end
  end
end
