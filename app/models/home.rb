class Home
  def initialize
    collision_data = NypdCollisionData.new
    collision_data.get_incidents
  end
end
