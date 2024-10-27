# app/controllers/admin/dashboard_controller.rb
module Admin
  class DashboardController < Admin::BaseController
    before_action :authenticate_user!
    before_action :ensure_admin!

    def index
      # your code for the dashboard
    end

    private

    def ensure_admin!
      unless current_user&.admin?
        flash[:alert] = "Access denied!"
        redirect_to root_path
      end
    end
  end
end
