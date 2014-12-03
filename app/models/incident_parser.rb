class IncidentParser
  def initialize(raw_incident)
    @raw_incident = raw_incident
  end

  def parse
    {
      cyclists_injured: @raw_incident["number_of_cyclist_injured"].to_i,
      cyclists_killed: @raw_incident["number_of_cyclist_killed"].to_i,
      date: @raw_incident["date"],
      key: @raw_incident["unique_key"],
      latitude: @raw_incident["latitude"],
      longitude: @raw_incident["longitude"],
      pedestrians_injured: @raw_incident["number_of_pedestrians_injured"].to_i,
      pedestrians_killed: @raw_incident["number_of_pedestrians_killed"].to_i,
    }
  end
end
