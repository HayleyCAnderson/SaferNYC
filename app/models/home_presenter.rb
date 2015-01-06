class HomePresenter
  def initialize
    @marker_incidents = Incident.good_data_in_time_range(1)
    @heatmap_incidents = Incident.good_data_in_time_range(6)
  end

  def mode_data
    GeojsonBuilder.new(@marker_incidents).build_json(ModeMarker)
  end

  def cause_data
    GeojsonBuilder.new(@marker_incidents).build_json(CauseMarker)
  end

  def heatmap_data
    GeojsonBuilder.new(@heatmap_incidents).build_json(NullMarker)
  end

  def most_recent_date
    format(@marker_incidents.order(date: :desc).first.date)
  end

  def marker_start_date
    format(@marker_incidents.order(date: :desc).last.date)
  end

  def heatmap_start_date
    format(@heatmap_incidents.order(date: :desc).last.date)
  end

  private

  def format(raw_date)
    Date.strptime(raw_date).strftime("%a, %b. %d, %Y")
  end
end
