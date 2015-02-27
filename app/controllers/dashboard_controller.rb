class DashboardController < ApplicationController
  before_action :authenticate_employee!

  expose(:employees) { current_employee.organization.employees }

  expose(:activities) { current_employee.activities }

  expose(:last_activity) { activities.order(:time).last }

  expose(:check_in_activity_type) { ActivityType.find_by_name(:check_in) }

  expose(:check_out_activity_type) { ActivityType.find_by_name(:check_out) }

  def index
  end
end