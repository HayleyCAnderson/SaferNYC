class ModeMarker
  def initialize(incident)
    @incident = incident
  end

  def build
    {
      "title" => Popup.new(@incident).add_content,
      "marker-size" => "small",
      "marker-color" => color,
      "marker-symbol" => symbol
    }
  end

  private

  def color
    if pedestrian_casualties? && !cyclist_casualties?
      "#AA2C3F"
    elsif cyclist_casualties? && !pedestrian_casualties?
      "#293659"
    else
      "#5A004C"
    end
  end

  def symbol
    if (@incident.pedestrians_killed + @incident.cyclists_killed) > 0
      "circle"
    end
  end

  def pedestrian_casualties?
    (@incident.pedestrians_injured + @incident.pedestrians_killed) > 0
  end

  def cyclist_casualties?
    (@incident.cyclists_injured + @incident.cyclists_killed) > 0
  end
end
