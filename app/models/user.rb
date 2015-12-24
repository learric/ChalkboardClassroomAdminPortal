class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :make_user_teacher
  after_create :create_teacher
  has_one :teacher

  private

    def create_teacher
      id = self.id
      Teacher.create(user_id: id)
    end

    def make_user_teacher
      self.is_teacher = true
      self.is_student = true
    end
end
