class ImproperBehaviorCause
  CAUSES = [
    "Aggressive Driving/Road Rage",
    "Alcohol Involvement",
    "Drugs (Illegal)",
    "Failure to Yield Right-of-Way",
    "Passing or Lane Usage Improper",
    "Traffic Control Disregarded",
    "Turning Improperly"
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#A32F43"
  end
end
