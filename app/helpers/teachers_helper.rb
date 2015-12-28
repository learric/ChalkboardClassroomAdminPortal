module TeachersHelper
  def self.is_teacher_admin?(current_user)
    if current_user && current_user.is_admin
      true
    else
      false
    end
  end
end
