class Classroom < ActiveRecord::Base

  belongs_to :school
  has_many :questions
  has_many :classroom_users

  has_many :users, :through => :classroom_users

  validates :name, :subject, :user_id, presence: true

end
