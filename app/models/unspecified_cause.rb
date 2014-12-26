class UnspecifiedCause
  CAUSES = [
    "Unspecified",
    nil
  ]

  def contains?(cause)
    CAUSES.include?(cause)
  end

  def color
    "#333F3F"
  end
end
