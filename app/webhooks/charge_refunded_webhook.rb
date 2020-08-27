class ChargeRefundedWebhook
  def call(event)
    object = event.data.object
    account = Account.find_by(stripe_id: object.customer)
    return if account.nil?

    charge = account.charges.find_by(stripe_id: object.id)
    return if charge.nil?

    charge.update(amount_refunded: object.amount_refunded)
  end
end
