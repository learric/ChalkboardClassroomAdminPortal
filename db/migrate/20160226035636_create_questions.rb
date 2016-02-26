class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :category
      t.string :first_line
      t.string :incorrect_one
      t.string :incorrect_two
      t.string :incorrect_three
      t.string :correct_answer

      t.belongs_to :school, index: true
      t.belongs_to :classroom, index: true

      t.timestamps null: false
    end
  end
end
