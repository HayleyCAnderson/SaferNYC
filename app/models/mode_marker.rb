class ModeMarker
  def build(incident)
    {
      "description" => Popup.new.add_content(incident),
      "marker-size" => "small",
      "marker-color" => color(incident),
      "marker-symbol" => symbol(incident)
    }
  end

  private

  def color(incident)
    if pedestrian_casualties?(incident) && !cyclist_casualties?(incident)
      "#AA2C3F"
    elsif cyclist_casualties?(incident) && !pedestrian_casualties?(incident)
      "#293659"
    else
      "#5A004C"
    end
  end

  def symbol(incident)
    if (incident.pedestrians_killed + incident.cyclists_killed) > 0
      "circle"
    end
  end

  def pedestrian_casualties?(incident)
    (incident.pedestrians_injured + incident.pedestrians_killed) > 0
  end

  def cyclist_casualties?(incident)
    (incident.cyclists_injured + incident.cyclists_killed) > 0
  end
end
