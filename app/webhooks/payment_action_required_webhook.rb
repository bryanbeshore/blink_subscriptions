class PaymentActionRequiredWebhook
  def call(event)
    object = event.data.object
    account = Account.find_by(stripe_id: object.customer)
    subscription = Subscription.find_by(stripe_id: object.subscription)

    return if account.nil? || subscription.nil?

    payment_intent = Stripe::PaymentIntent.retrieve(object.payment_intent)

    AccountMailer.payment_action_required(account, object.payment_intent, subscription).deliver_later
  end
end
