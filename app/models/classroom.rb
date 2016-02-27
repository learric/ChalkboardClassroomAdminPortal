class Classroom < ActiveRecord::Base

  belongs_to :school
  has_many :questions
  has_and_belongs_to_many :users

end
