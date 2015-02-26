class ActivitiesController < ApplicationController
  expose(:activities) { current_employee.activities }

  expose(:activity)

  def create
    activity.attributes = activity_params
    activity.time = Time.now.utc

    if activity.save
      redirect_to root_path, notice: 'Done'
    else
      redirect_to root_path, alert: 'Oops'
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:activity_type_id)
  end
end