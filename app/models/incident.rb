class Incident < ActiveRecord::Base
  geocoded_by :cross_streets
  after_validation :geocode, if: ->(incident){ incident.latitude == 0.0 }

  def cross_streets
    "#{on_street_name} and #{cross_street_name}, #{borough}, NY #{zip_code}"
  end

  def self.good_data_in_time_range(number_of_months)
    where(date: between_dates(number_of_months)).where.not(latitude: 0.0)
  end

  def self.between_dates(number_of_months)
    most_recent_date = Date.strptime(Incident.order(date: :desc).first.date)
    start_date = most_recent_date.prev_month(number_of_months)
    start_date.strftime("%FT%T")..most_recent_date.strftime("%FT%T")
  end
end
