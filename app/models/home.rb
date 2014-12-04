class Home
  def initialize
    collision_data = NypdCollisionData.new
    collision_data.get_incidents
  end

  def data
    Incident.all
  end
end
