module Accounts
  class SubscriptionsController < Accounts::BaseController
    before_action :set_plan, only: [:new, :create, :update]
    
    def show
      @subscription = current_account.subscription
    end

    def new
    end

    def create
      current_account.update_card(params[:payment_method_id]) if params[:payment_method_id].present?
      current_account.subscribe(@plan.stripe_id)
      redirect_to root_path, notice: "Thanks for subscribing"
    rescue PaymentIncomplete => e
      redirect_to payment_path(e.payment_intent.id)
    end

    def edit
      @subscription = current_account.subscription
      @plans = Plan.all
    end

    def update
      @subscription = current_account.subscription
      @subscription.swap(@plan.stripe_id)
      redirect_to subscription_path, notice: "You have successfully changed plans."
    end

    private

      def set_plan
        @plan = Plan.find_by(id: params[:plan_id])
        redirect_to pricing_path if @plan.nil?
      end
  end
end



# class Accounts::PlansController < Accounts::BaseController
#   def choose
#     @plan = Plan.all
#   end

#   def chosen
#     customer = Stripe::Customer.retrieve(current_account.stripe_id)
#     plan = Plan.find(params[:account][:plan_id])
#     subscription = customer.subscriptions.create(
#       plan: plan.stripe_id,
#       source: params[:token]
#     )

#     current_account.plan = plan
#     current_account.stripe_id = subscription.id
#     current_account.save
#     flash[:notice] = "Your account has been created."
#     redirect_to root_url(subdomain: current_account.subdomain)
#   end
# end
