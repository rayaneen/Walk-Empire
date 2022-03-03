class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @user = current_user
    @control_point = ControlPoint.find(params[:id])
    @activity = Activity.new()
    if @activity.save
      render 'activity_km'
    else
      raise
    end
  end
end
