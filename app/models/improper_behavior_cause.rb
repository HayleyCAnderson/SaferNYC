class ImproperBehaviorCause
  CAUSES = [
    "Aggressive Driving/Road Rage",
    "Traffic Control Disregarded",
    "Drugs (Illegal)",
    "Alcohol Involvement",
    "Turning Improperly",
    "Passing or Lane Usage Improper",
    "Failure to Yield Right-of-Way"
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#A32F43"
  end
end
