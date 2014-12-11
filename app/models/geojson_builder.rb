class GeojsonBuilder
  def initialize(incidents)
    @incidents = incidents
  end

  def to_json
    @incidents.map do |incident|
      incident_as_json(incident)
    end.to_json
  end

  private

  def incident_as_json(incident)
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [incident.longitude, incident.latitude]
      },
      properties: {
        "title" => popup_content(incident),
        "marker-size" => "small",
        "marker-color" => marker_color(incident),
        "marker-symbol" => marker_symbol(incident)
      }
    }
  end

  def popup_content(incident)
    "<div class='popup'>#{date(incident)}#{cause(incident)}#{vehicle(incident)}</div>"
  end

  def date(incident)
    "<p><span>Date:</span> #{Date.strptime(incident.date).strftime("%a, %b. %d, %Y")}</p>"
  end

  def cause(incident)
    "<p><span>Cause:</span> #{(incident.cause || "None listed").capitalize}</p>"
  end

  def vehicle(incident)
    "<p><span>Vehicle:</span> #{(incident.vehicle_type || "None listed").capitalize}</p>"
  end

  def marker_color(incident)
    if pedestrian_casualties?(incident) && !cyclist_casualties?(incident)
      "#AA2C3F"
    elsif cyclist_casualties?(incident) && !pedestrian_casualties?(incident)
      "#293659"
    else
      "#44004C"
    end
  end

  def marker_symbol(incident)
    if (incident.pedestrians_killed + incident.cyclists_killed) > 0
      "circle"
    end
  end

  def pedestrian_casualties?(incident)
    (incident.pedestrians_injured + incident.pedestrians_killed) > 0
  end

  def cyclist_casualties?(incident)
    (incident.cyclists_injured + incident.cyclists_killed) > 0
  end
end
