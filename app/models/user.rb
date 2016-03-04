class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :school
  has_many :classroom_users

  has_many :classrooms, :through => :classroom_users

  validates :first_name, :last_name, :role, :school_id, presence: true

end
