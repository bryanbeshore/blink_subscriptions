module Api
  module V1
    class UsersController < ApiController
      # before_action :doorkeeper_authorize!
      respond_to :json

      def me
      end

      def all
        @users = User.all
      end
    end
  end
end