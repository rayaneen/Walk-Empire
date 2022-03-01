class ControlPointsController < ApplicationController
  def index
    @control_points = ControlPoint.all
    @markers = @control_points.map do |control_point|
      {
        lat: control_point.latitude,
        lng: control_point.longitude,
        show: render_to_string(partial: "show", locals: { control_point: control_point })
      }
    end
  end

  def show
    @control_point = ControlPoint.find(params[:id])
  end
end
