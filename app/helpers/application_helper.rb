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

  def subscription_plan_name(subscription)
    if subscription.stripe_plan == "price_1HK4GXE45tZHky7ewO1ItB0X"
      "Large Annual"
    elsif subscription.stripe_plan == "price_1HK4GwE45tZHky7erUPAXxgq"
      "Large Monthly"
    elsif subscription.stripe_plan == "price_1HK4HJE45tZHky7exl4966in"
      "Small Annual"
    elsif subscription.stripe_plan == "price_1HK4HZE45tZHky7eBtCrdimr"
      "Small Monthly"
    end
  end
end