class DataDeleter
  def delete_recent_data(days_back)
    Incident.where("date > ?", key_date(days_back)).delete_all
  end

  def delete_old_data(days_back)
    Incident.where("date < ?", key_date(days_back)).delete_all
  end

  private

  def key_date(days_back)
    IncidentDate.parse(Incident.most_recent_date).prev_day(days_back).api_format
  end
end
