class CauseMarker
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
    if environmental_medical_mechanical.include?(@incident.cause)
      "#291D40"
    elsif road_condition.include?(@incident.cause)
      "#84CBC5"
    elsif unsafe_behavior.include?(@incident.cause)
      "#64D66A"
    elsif improper_behavior.include?(@incident.cause)
      "#2F7F94"
    elsif @incident.cause == "Unspecified" || @incident.cause.blank?
      "#4B498C"
    else
      "#752650"
    end
  end

  def environmental_medical_mechanical
    [
      "Glare",
      "Pavement Slippery",
      "View Obstructed/Limited",
      "Lost Consciousness",
      "Physical Disability",
      "Prescription Medication",
      "Illness",
      "Steering Failure",
      "Brakes Defective",
      "Oversized Vehicle"
    ]
  end

  def road_condition
    [
      "Pavement Defective",
      "Traffic Control Device Improper/Non-Working",
      "Other Lighting Defects",
      "Obstruction/Debris"
    ]
  end

  def unsafe_behavior
    [
      "Following Too Closely",
      "Unsafe Speed",
      "Backing Unsafely",
      "Failure to Keep Right",
      "Other Electronic Device",
      "Outside Car Distraction",
      "Driver Inattention/Distraction",
      "Passenger Distraction",
      "Driver Inexperience",
      "Reaction to Other Uninvolved Vehicle",
      "Fatigued/Drowsy",
      "Fell Asleep"
    ]
  end

  def improper_behavior
    [
      "Aggressive Driving/Road Rage",
      "Traffic Control Disregarded",
      "Drugs (Illegal)",
      "Alcohol Involvement",
      "Turning Improperly",
      "Passing or Lane Usage Improper",
      "Failure to Yield Right-of-Way"
    ]
  end

  def symbol
    if (@incident.cyclists_injured + @incident.cyclists_killed) > 0
      "bicycle"
    end
  end
end
