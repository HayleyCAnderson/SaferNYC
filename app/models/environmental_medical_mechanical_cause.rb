class EnvironmentalMedicalMechanicalCause
  CAUSES = [
    "Accelerator Defective",
    "Brakes Defective",
    "Glare",
    "Illness",
    "Lost Consciousness",
    "Oversized Vehicle",
    "Pavement Slippery",
    "Physical Disability",
    "Prescription Medication",
    "Steering Failure",
    "View Obstructed/Limited"
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#BFD13C"
  end
end
