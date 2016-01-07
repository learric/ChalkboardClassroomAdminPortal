class Student < ActiveRecord::Base
  belongs_to :user

  has_many :classrooms, through: :student_classrooms
  has_many :student_classrooms
end
