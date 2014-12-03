class RawIncident
  def initialize(raw_incident)
    @raw_incident = raw_incident
  end

  def key
    get("unique_key")
  end

  def date
    get("date")
  end

  def latitude
    get("latitude")
  end

  def longitude
    get("longitude")
  end

  def pedestrian_casualties?
    check("number_of_pedestrians_injured", "number_of_pedestrians_killed")
  end

  def cyclist_casualties?
    check("number_of_cyclist_injured", "number_of_cyclist_killed")
  end

  private

  def get(data_point)
    if @raw_incident[data_point].empty?
      RawIncident.delete
    else
      @raw_incident[data_point]
    end
  end

  def check(number_injured, number_killed)
    (@raw_incident[number_injured].to_i + @raw_incident[number_killed].to_i) > 0
  end
end
