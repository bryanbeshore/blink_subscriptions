module ApplicationHelper
  def admin?
    user_signed_in? && current_user.admin?
  end

  def author_of(resource)
    user_signed_in && current_user.id = resource.user_id
  end

  def formatted_amount(amount, options={})
    number_to_currency(amount.to_i / 100.0, options)
  end
end