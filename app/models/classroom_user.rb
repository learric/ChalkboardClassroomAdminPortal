class ClassroomUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :classroom

  validates :user_id, :classroom_id, presence: true
  validates :user_id, uniqueness: { scope: :classroom_id }

end
