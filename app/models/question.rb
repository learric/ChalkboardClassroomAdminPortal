class Question < ActiveRecord::Base
  belongs_to :school
  belongs_to :classroom
end
