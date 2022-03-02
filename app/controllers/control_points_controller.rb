class ControlPointsController < ApplicationController
  def index
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
    render partial: 'control_points/show', locals: { control_point: @control_point }, formats: [:html]
  end
end
