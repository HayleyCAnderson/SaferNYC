class HomesController < ApplicationController
  def show
    marker_builder = GeojsonBuilder.new(Incident.all)
    @marker_data_set = marker_builder.to_json
  end
end
