class HomesController < ApplicationController
  def show
    marker_incidents = Incident.good_data_in_time_range(1)
    heatmap_incidents = Incident.good_data_in_time_range(6)
    @mode_data_set = GeojsonBuilder.new(marker_incidents).to_mode_json
    @cause_data_set = GeojsonBuilder.new(marker_incidents).to_cause_json
    @heatmap_data_set = GeojsonBuilder.new(heatmap_incidents).to_heatmap_json
    get_date_data(marker_incidents, heatmap_incidents)
  end

  private

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
