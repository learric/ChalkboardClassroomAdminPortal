class Classroom < ActiveRecord::Base
  belongs_to :user
  belongs_to :school

  has_many :users
  has_many :questions
end
