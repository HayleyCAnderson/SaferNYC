class HomesController < ApplicationController
  def show
    marker_builder = GeojsonBuilder.new(incidents_in_past_months(1))
    @marker_data_set = marker_builder.to_json
    heatmap_builder = GeojsonBuilder.new(incidents_in_past_months(6))
    @heatmap_data_set = heatmap_builder.to_json
  end

  private

  def incidents_in_past_months(number_of_months)
    Incident.where(date: between_dates(number_of_months)).where.not(latitude: 0.0)
  end

  def between_dates(number_of_months)
    @most_recent_date = Date.strptime(Incident.order(date: :desc).first.date)
    set_start_month(number_of_months)
    ("#{start_month(number_of_months)}T00:00:00".."#{@most_recent_date}T00:00:00")
  end

  def set_start_month(number_of_months)
    if number_of_months == 1
      @one_month_before = start_month(number_of_months)
    else
      @months_before = start_month(number_of_months)
    end
  end

  def start_month(number_of_months)
    @most_recent_date.prev_month(n = number_of_months)
  end
end
