class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
    @user = current_user
    @control_point = ControlPoint.find(params[:control_point_id])
    @markers =
      [{
        lat: @control_point.latitude,
        lng: @control_point.longitude,
        id: @control_point.id,
        user_id: current_user.id,
        control_point_user_id: @control_point.user_id,
        admin: @control_point.admin?
      }
      ]
  end

  def create
    @user = current_user
    @control_point = ControlPoint.find(params[:control_point_id])
    @activity = Activity.new(user_id: @user.id, control_point_id: @control_point.id, status: 'Pending', itinary: [[-0.564462, 44.857597]])
    redirect_to control_point_activity_path(@control_point, @activity) if @activity.save
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.assign_attributes(activity_params)
    @activity.save
    render json: @activity
  end

  private

  def activity_params
    params.require(:activity).permit(:distance, :status, :itinary)
  end
end
