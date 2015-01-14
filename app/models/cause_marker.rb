class CauseMarker
  def build(incident)
    {
      "description" => Popup.new.add_content(incident),
      "marker-size" => "small",
      "marker-color" => CauseColor.build(incident),
      "marker-symbol" => symbol(incident)
    }
  end

  private

  def symbol(incident)
    if (incident.cyclists_injured + incident.cyclists_killed) > 0
      "bicycle"
    end
  end
end
