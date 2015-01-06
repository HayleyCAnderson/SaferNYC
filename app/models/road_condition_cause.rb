class RoadConditionCause
  CAUSES = [
    "Obstruction/Debris",
    "Other Lighting Defects",
    "Pavement Defective",
    "Traffic Control Device Improper/Non-Working"
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#F9C433"
  end
end
