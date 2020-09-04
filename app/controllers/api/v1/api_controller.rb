module Api
  module V1
    class ApiController < ::ApplicationController
      skip_before_action :verify_authenticity_token
      # before_action :doorkeeper_authorize!, unless: :user_signed_in? (maybe use this. from: https://www.xspdf.com/help/50776537.html)

      private

      # def current_resource_owner
      #   User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      # end
      def current_resource_owner
        @current_user ||= if doorkeeper_token
          User.find(doorkeeper_token.resource_owner_id)
        else
          warden.authenticate(scope: :user)
        end
      end
      helper_method :current_resource_owner

      def all_users
        @all_users = User.all
      end
      helper_method :all_users

      def all_accounts
        @all_accounts = Account.all
      end
      helper_method :all_accounts

    end
  end
end