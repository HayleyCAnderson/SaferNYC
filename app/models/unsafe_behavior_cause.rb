class UnsafeBehaviorCause
  CAUSES = [
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

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#BBA5D3"
  end
end
