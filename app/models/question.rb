class Question < ActiveRecord::Base
  belongs_to :school
  belongs_to :classroom

  validates :category, :first_line, :incorrect_one, :incorrect_two, :incorrect_three, :correct_answer, presence: true
end
