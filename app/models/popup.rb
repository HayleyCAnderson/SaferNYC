class Popup
  def initialize(incident)
    @incident = incident
  end

  def add_content
    "<div class='popup'><p>#{date}</p><p>#{cause}</p><p>#{vehicle}</p></div>"
  end

  private

  def date
    "<span>Date:</span> #{Date.strptime(@incident.date).strftime("%a, %b. %d, %Y")}"
  end

  def cause
    "<span>Cause:</span> #{(@incident.cause || "None listed").capitalize}"
  end

  def vehicle
    "<span>Vehicle:</span> #{(@incident.vehicle_type || "None listed").capitalize}"
  end
end
