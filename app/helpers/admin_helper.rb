module AdminHelper
  def self.is_user_admin?(current_user)
    if current_user && current_user.is_admin
      true
    end
  end
end
