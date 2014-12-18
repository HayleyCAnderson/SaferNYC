class GeojsonBuilder
  def initialize(incidents)
    @incidents = incidents
  end

  def to_mode_json
    @incidents.map do |incident|
      marker = ModeMarker.new(incident).build
      incident_as_json(incident, marker)
    end.to_json
  end

  def to_cause_json
    @incidents.map do |incident|
      marker = CauseMarker.new(incident).build
      incident_as_json(incident, marker)
    end.to_json
  end

  def to_heatmap_json
    @incidents.map do |incident|
      marker = {}
      incident_as_json(incident, marker)
    end.to_json
  end

  private

  def incident_as_json(incident, marker)
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [incident.longitude, incident.latitude]
      },
      properties: marker
    }
  end
end
