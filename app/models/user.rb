class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teachers
  has_many :students

  after_create :create_student
  after_create :create_teacher

  private

    def create_student
      Student.create(id: self.id, user_id: self.id)
    end

    def create_teacher
      if self.is_teacher
        Teacher.create(id: self.id, user_id: self.id)
      end
    end
end
