module Admin
  class PanelController < AdminController
    expose(:active_employees) { organization.employees.active }

    def index
    end
  end
end