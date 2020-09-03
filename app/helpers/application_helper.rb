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

  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, size: size)
    end
  end
end