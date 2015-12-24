class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_teacher
  has_one :teacher

  private

    def create_teacher
      id = self.id
      Teacher.create(user_id: id)
    end
end
