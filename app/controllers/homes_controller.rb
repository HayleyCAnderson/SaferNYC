class HomesController < ApplicationController
  def show
    marker_builder = GeojsonBuilder.new(incidents_in_past_month)
    @marker_data_set = marker_builder.to_json
  end

  private

  def incidents_in_past_month
    Incident.where(date: between_dates)
  end

  def between_dates
    @most_recent_date = Date.strptime(Incident.order(date: :desc).first.date)
    @one_month_before = @most_recent_date.prev_month
    ("#{@one_month_before}T00:00:00".."#{@most_recent_date}T00:00:00")
  end
end
