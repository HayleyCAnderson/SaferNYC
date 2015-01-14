class DataDeleter
  def delete_old_data
    Incident.where("date < ?", delete_before_date).delete_all
  end

  private

  def delete_before_date
    IncidentDate.parse(Incident.most_recent_date).prev_month(8).api_format
  end
end
