class HomesController < ApplicationController
  def show
    marker_incidents = Incident.good_data_in_time_range(1)
    heatmap_incidents = Incident.good_data_in_time_range(6)
    @marker_data_set = geojson(marker_incidents)
    @heatmap_data_set = geojson(heatmap_incidents)
    get_date_data(marker_incidents, heatmap_incidents)
  end

  private

  def geojson(incidents)
    GeojsonBuilder.new(incidents).to_json
  end

  def get_date_data(marker_incidents, heatmap_incidents)
    @date_data = {
      most_recent: pretty_date(marker_incidents.order(date: :desc).first.date),
      marker_start: pretty_date(marker_incidents.order(date: :desc).last.date),
      heatmap_start: pretty_date(heatmap_incidents.order(date: :desc).last.date)
    }
  end

  def pretty_date(raw_date)
    Date.strptime(raw_date).strftime("%a, %b. %d, %Y")
  end
end
