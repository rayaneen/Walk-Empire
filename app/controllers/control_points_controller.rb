class ControlPointsController < ApplicationController

  def index
    @user = current_user
    @control_points = ControlPoint.all
    @markers = @control_points.map do |control_point|
      {
        lat: control_point.latitude,
        lng: control_point.longitude,
        id: control_point.id,
        user_id: current_user.id,
        control_point_user_id: control_point.user_id,
        admin: control_point.admin?
      }
    end
  end

  def show
    @control_point = ControlPoint.find(params[:id])
    @activity = current_user.current_activity(@control_point)
    render partial: 'control_points/show', locals: { control_point: @control_point, activity: @activity }, formats: [:html]
  end

  def update
    @control_point = ControlPoint.find(params[:control_point_id])
    @activity = Activity.find_by(user_id: current_user.id)
    if @activity.distance >= @control_point.difficulty
      @control_point.user_id = current_user.id
      current_user.xp += 1
      current_user.save
      @control_point.save
    else
      redirect_to root_path
    end
    redirect_to root_path
  end
end
