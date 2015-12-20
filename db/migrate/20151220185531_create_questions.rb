class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :category
      t.text :first_line
      t.text :last_line
      t.string :incorrect_one
      t.string :incorrect_two
      t.string :incorrect_three
      t.string :correct_answer

      t.timestamps null: false
    end
  end
end
