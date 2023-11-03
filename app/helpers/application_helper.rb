module ApplicationHelper

  def is_admin?
    current_user.has_role? :admin
  end
end
