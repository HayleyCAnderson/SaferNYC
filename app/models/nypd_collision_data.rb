class NypdCollisionData
  def initialize
    @data_collector = DataCollector.new
  end

  def get_incidents
    collisions = @data_collector.collisions
    collisions.map do |raw_incident|
      Incident.create(IncidentParser.new(raw_incident).parse)
    end
  end
end
