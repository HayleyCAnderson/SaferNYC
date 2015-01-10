class Incident < ActiveRecord::Base
  geocoded_by :cross_streets
  after_validation :geocode, if: ->(incident){ incident.latitude == 0.0 }

  def cross_streets
    "#{on_street_name} and #{cross_street_name}, #{borough}, NY #{zip_code}"
  end

  def self.good_data_in_date_range(last_date, number_of_months)
    in_date_range(last_date, number_of_months).has_location.includes_data
  end

  def self.in_date_range(last_date, number_of_months)
    where(date: between_dates(last_date, number_of_months))
  end

  def self.has_location
    where.not(latitude: 0.0)
  end

  def self.includes_data
    select("#{incident_information}, #{incident_casualties}")
  end

  def self.between_dates(last_date, number_of_months)
    last_date = Date.parse(last_date)
    start_date = last_date.prev_month(number_of_months)
    start_date.strftime("%FT%T")..last_date.strftime("%FT%T")
  end

  def self.incident_information
    "latitude, longitude, date, cause, vehicle_type"
  end

  def self.incident_casualties
    "pedestrians_injured, cyclists_injured, pedestrians_killed, cyclists_killed"
  end
end
