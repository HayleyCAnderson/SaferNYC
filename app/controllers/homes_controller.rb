class HomesController < ApplicationController
  def show
    Home.new
    marker_builder = GeojsonBuilder.new(Incident.all)
    @marker_data_set = marker_builder.to_json
  end
end
