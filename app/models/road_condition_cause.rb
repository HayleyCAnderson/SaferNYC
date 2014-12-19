class RoadConditionCause
  CAUSES = [
    "Pavement Defective",
    "Traffic Control Device Improper/Non-Working",
    "Other Lighting Defects",
    "Obstruction/Debris"
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#84CBC5"
  end
end
