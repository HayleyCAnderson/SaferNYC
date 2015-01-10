class GeojsonBuilder
  def build_json(incidents, marker_type)
    incidents.map do |incident|
      marker = marker_type.new(incident).build
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
