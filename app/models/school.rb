class School < ActiveRecord::Base
  has_many :users
  has_many :classrooms
  has_many :questions
end
