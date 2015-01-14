class Popup
  def add_content(incident)
    "<div class='popup'>#{date(incident)}#{cause(incident)}#{vehicle(incident)}</div>"
  end

  private

  def date(incident)
    "<p><span>Date:</span> #{IncidentDate.parse(incident.date).nice_format}</p>"
  end

  def cause(incident)
    "<p><span>Cause:</span> #{(incident.cause || "None listed").capitalize}</p>"
  end

  def vehicle(incident)
    "<p><span>Vehicle:</span> #{(incident.vehicle_type || "None listed").capitalize}</p>"
  end
end
