class UnsafeBehaviorCause
  CAUSES = [
    "Backing Unsafely",
    "Driver Inattention/Distraction",
    "Driver Inexperience",
    "Failure to Keep Right",
    "Fatigued/Drowsy",
    "Fell Asleep",
    "Following Too Closely",
    "Other Electronic Device",
    "Outside Car Distraction",
    "Passenger Distraction",
    "Reaction to Other Uninvolved Vehicle",
    "Unsafe Speed"
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#EAA1B9"
  end
end
