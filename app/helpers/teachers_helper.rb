module TeachersHelper
  def self.is_teacher?(current_user)
    if current_user && current_user.is_teacher
      true
    end
  end

  def self.is_teacher_admin?(current_user)
    if current_user && current_user.is_admin
      true
    end
  end
end
