module Api
  module V1
    class AccountsController < ApiController
      # before_action :doorkeeper_authorize!
      respond_to :json

      def accounts
        @accounts = Account.all
      end
    end
  end
end