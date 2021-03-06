class NypdCollisionData
  def initialize
    @data_collector = DataCollector.new
  end

  def get_incidents
    @data_collector.collisions.map do |raw_incident|
      Incident.create(parse_data(raw_incident))
    end
  end

  private

  def parse_data(raw_incident)
    {
      borough: raw_incident["borough"],
      cause: raw_incident["contributing_factor_vehicle_1"],
      cyclists_injured: raw_incident["number_of_cyclist_injured"].to_i,
      cyclists_killed: raw_incident["number_of_cyclist_killed"].to_i,
      date: raw_incident["date"],
      key: raw_incident["unique_key"],
      latitude: raw_incident["latitude"].to_f,
      longitude: raw_incident["longitude"].to_f,
      cross_street_name: raw_incident["off_street_name"],
      on_street_name: raw_incident["on_street_name"],
      pedestrians_injured: raw_incident["number_of_pedestrians_injured"].to_i,
      pedestrians_killed: raw_incident["number_of_pedestrians_killed"].to_i,
      vehicle_type: raw_incident["vehicle_type_code1"],
      zip_code: raw_incident["zip_code"]
    }
  end
end
