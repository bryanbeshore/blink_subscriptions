class PaymentActionRequiredPreview < ActionMailer::Preview
  def payment_action_required
    account = Account.new(subdomain: "Blink", name: "Test User")
    subscription = Subscription.new
    payment_intent = Stripe::PaymentIntent.retrieve("pi_1HKmm9E45tZHky7eEr4WOVoA")

    AccountMailer.payment_action_required(account, payment_intent, subscription)
  end
end
