class HomesController < ApplicationController
  def show
    Home.new
    @marker_data_set = Incident.to_geojson.to_json
  end
end
