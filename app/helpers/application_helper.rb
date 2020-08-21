module ApplicationHelper
  def admin?
    user_signed_in? && current_user.admin?
  end

  def author_of(resource)
    user_signed_in && current_user.id = resource.user_id
  end
end
