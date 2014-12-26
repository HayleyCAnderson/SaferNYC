class EnvironmentalMedicalMechanicalCause
  CAUSES = [
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

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#BFD13C"
  end
end
