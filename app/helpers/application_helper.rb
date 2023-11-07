module ApplicationHelper

  def is_admin?
    current_user.has_role? :admin
  end

  def flash_class(level)
    case level
    when :success then 'alert alert-success'
    

    when :alert then 'alert-alert-danger'
    end
  end
end
