module Admin
  class AdminController < ApplicationController
    before_action :authenticate_employee!
    before_action :require_admin!

    expose(:organization) { current_employee.organization }

    def require_admin!
      if current_employee.admin?
        true
      else
        redirect_to root_path
      end
    end
  end
end