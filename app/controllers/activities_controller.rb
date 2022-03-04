class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @user = current_user
    @control_point = ControlPoint.find(params[:control_point_id])
    @activity = Activity.new(user_id: @user.id, control_point_id: @control_point.id)
    if @activity.save
      redirect_to user_activity_path(@user, @activity)
    else
      raise
    end
  end
end
