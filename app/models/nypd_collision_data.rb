class NypdCollisionData
  def initialize
    @collisions = HTTParty.get("http://data.cityofnewyork.us/resource/h9gi-nx95.json?$select=unique_key,date,zip_code,latitude,longitude,on_street_name,off_street_name,number_of_pedestrians_injured,number_of_pedestrians_killed,number_of_cyclist_injured,number_of_cyclist_killed&$where=latitude%20IS%20NOT%20NULL%20AND%20longitude%20IS%20NOT%20NULL%20AND%20(number_of_pedestrians_injured%3E0%20OR%20number_of_pedestrians_killed%3E0%20OR%20number_of_cyclist_injured%3E0%20OR%20number_of_cyclist_killed%3E0)&$order=date%20DESC")
  end

  def get_incidents
    @collisions.map do |raw_incident|
      incident = RawIncident.new(raw_incident)
      unless Incident.exists?(key: incident.key)
        Incident.create(attributes(incident))
      end
    end
  end

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
