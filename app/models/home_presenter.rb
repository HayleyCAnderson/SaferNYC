class HomePresenter
  def initialize
    @marker_incidents = Incident.good_data_in_date_range(1)
    @heatmap_incidents = Incident.good_data_in_date_range(6)
  end

  def mode_data
    GeojsonBuilder.new.build_json(@marker_incidents, ModeMarker)
  end

  def cause_data
    GeojsonBuilder.new.build_json(@marker_incidents, CauseMarker)
  end

  def heatmap_data
    GeojsonBuilder.new.build_json(@heatmap_incidents, NullMarker)
  end

  def most_recent_date
    IncidentDate.parse(Incident.most_recent_date).nice_format
  end

  def marker_start_date
    IncidentDate.parse(@marker_incidents.start_date).nice_format
  end

  def heatmap_start_date
    IncidentDate.parse(@heatmap_incidents.start_date).nice_format
  end
end
