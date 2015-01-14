class IncidentDate < Date
  def api_format
    strftime("%FT%T")
  end

  def nice_format
    strftime("%a, %b. %d, %Y")
  end
end
