class ControlPointsController < ApplicationController
  def index
    @control_points = ControlPoint.all
    @markers = @control_points.map do |control_point|
      {
        lat: control_point.latitude,
        lng: control_point.longitude
      }
    end
  end

  def show
  end
end
