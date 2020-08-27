class ChargeSucceededWebhook
  def call(event)
    object = event.data.object
    account = Account.find_by(stripe_id: object.customer)
    return if account.nil?
    return if account.charges.where(stripe_id: object.id).any?

    account.charges.create(
      stripe_id: object.id,
      amount: object.amount,
      card_brand: object.payment_method_details.card.brand.titleize,
      card_last4: object.payment_method_details.card.last4,
      card_exp_month: object.payment_method_details.card.exp_month,
      card_exp_year: object.payment_method_details.card.exp_year,
      created_at: Time.at(object.created)
    )
  end
end
