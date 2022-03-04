class ControlPointsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @user = current_user
    @control_points = ControlPoint.all
    @markers = @control_points.map do |control_point|
      {
        lat: control_point.latitude,
        lng: control_point.longitude,
        id: control_point.id
      }
    end
  end

  def show
    @control_point = ControlPoint.find(params[:id])
    @activity = current_user.current_activity(@control_point)
    render partial: 'control_points/show', locals: { control_point: @control_point, activity: @activity }, formats: [:html]
  end
end
