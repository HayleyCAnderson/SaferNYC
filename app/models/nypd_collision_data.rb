class NypdCollisionData
  def initialize
    data_collector = DataCollector.new
    @collisions = data_collector.get_collisions
  end

  def get_incidents
    @collisions.map do |raw_incident|
      incident = RawIncident.new(raw_incident)
      unless Incident.exists?(key: incident.key)
        Incident.create(attributes(incident))
      end
    end
  end

  private

  def attributes(incident)
    {
      key: incident.key,
      date: incident.date,
      latitude: incident.latitude,
      longitude: incident.longitude,
      pedestrian_casualties: incident.pedestrian_casualties?,
      cyclist_casualties: incident.cyclist_casualties?
    }
  end
end
