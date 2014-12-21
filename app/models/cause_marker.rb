class CauseMarker
  def initialize(incident)
    @incident = incident
  end

  def build
    {
      "title" => Popup.new(@incident).add_content,
      "marker-size" => "small",
      "marker-color" => CauseColor.build(@incident),
      "marker-symbol" => symbol
    }
  end

  private

  def symbol
    if (@incident.cyclists_injured + @incident.cyclists_killed) > 0
      "bicycle"
    end
  end
end
