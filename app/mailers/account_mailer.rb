class AccountMailer < ApplicationMailer
  def payment_action_required(account, payment_intent_id, subscription)
    @account = account
    @payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)
    @subscription = subscription

    mail to: @account.owner.email, subject: "Payment confirmation required"
  end
end
