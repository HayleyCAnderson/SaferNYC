class CauseColor
  CAUSE_TYPES = [
    EnvironmentalMedicalMechanicalCause,
    RoadConditionCause,
    UnsafeBehaviorCause,
    ImproperBehaviorCause,
    UnspecifiedCause,
    OtherCause
  ]

  def self.build(incident)
    cause_types = CAUSE_TYPES.map { |cause_class| cause_class.new }
    cause_type = cause_types.detect { |type| type.contains?(incident.cause) }
    cause_type.color
  end
end
