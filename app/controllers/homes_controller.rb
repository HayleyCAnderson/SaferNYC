class HomesController < ApplicationController
  def show
    data = NypdCollisionData.new
    data.get_incidents
    @collisions = Incident.all
  end
end
