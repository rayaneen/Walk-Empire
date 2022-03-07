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
        id: @control_point.id
      }]
  end

  def create
    @user = current_user
    @control_point = ControlPoint.find(params[:control_point_id])
    @activity = Activity.new(user_id: @user.id, control_point_id: @control_point.id)
    redirect_to control_point_activity_path(@control_point, @activity) if @activity.save
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  def update
    puts "$$$$$$$$$$$$$$$"
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    render json: @activity
  end

  private

  def activity_params
    puts "================="
    puts params
    params.require(:activity).permit(:distance, :itinary, :status)
  end
end
