class GeojsonBuilder
  def build_json(incidents, marker_type)
    incidents.map do |incident|
      incident_as_json(incident, marker_type)
    end.to_json
  end

  private

  def incident_as_json(incident, marker_type)
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [incident.longitude, incident.latitude]
      },
      properties: marker_type.new.build(incident)
    }
  end
end
