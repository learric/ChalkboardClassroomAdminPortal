class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teachers
  has_many :students

  after_create :create_student

  private

    def create_student
      Student.create(user_id: self.id, email: self.email)
    end
end
