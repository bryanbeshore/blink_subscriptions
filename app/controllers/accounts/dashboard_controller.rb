module Accounts
  class DashboardController < Accounts::BaseController
    before_action :authenticate_user!
    
    def index
    end
  end
end
