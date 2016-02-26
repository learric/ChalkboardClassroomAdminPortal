class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :subject

      t.belongs_to :school, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
