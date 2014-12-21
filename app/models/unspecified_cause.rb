class UnspecifiedCause
  CAUSES = [
    "Unspecified",
    nil
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#4B498C"
  end
end
