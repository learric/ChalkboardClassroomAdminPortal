class Classroom < ActiveRecord::Base
  belongs_to :teacher

  has_many :students, through: :student_classrooms
  has_many :student_classrooms
end
