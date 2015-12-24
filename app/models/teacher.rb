class Teacher < ActiveRecord::Base
  belongs_to :user
  after_create :make_user_teacher

  private

    def make_user_teacher
      id = self.user_id
      user = User.find(id)
      user.is_teacher = true
      user.is_student= true
    end
end
