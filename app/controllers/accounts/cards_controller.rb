module Accounts
  class CardsController < Accounts::BaseController

    def edit
      @setup_intent = current_account.create_setup_intent
    end

    def update
      current_account.update_card(params[:payment_method_id])
      redirect_to edit_card_path, notice: "Your card was successfully updated."
    rescue Stripe::Error => e
      redirect_to edit_card_path, alert: "Our payment processor returned the following error: #{e.message}"
    end
  end
end
