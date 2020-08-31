class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      @account.memberships.create(user_id: @account.owner.id, account_id: @account.id)
      sign_in(@account.owner)
      flash[:notice] = "Your account has been created."
      redirect_to root_url(subdomain: @account.subdomain)
      @account.memberships.create(user_id: current_user, account_id: current_account)
    else
      flash.now[:alert] = "Sorry, your account could not be created."
      render :new
    end
  end

  private
    
    def account_params
      params.require(:account).permit(:name, :subdomain,
        { owner_attributes: [
          :email, :password, :password_confirmation
        ]}
      )
    end
end
