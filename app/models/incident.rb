class Incident < ActiveRecord::Base
  geocoded_by :cross_streets
  after_validation :geocode, if: ->(incident){ incident.latitude == 0.0 }

  def cross_streets
    "#{on_street_name} and #{cross_street_name}, #{borough}, NY #{zip_code}"
  end

  def self.good_data_in_date_range(number_of_months)
    where(date: between_dates(number_of_months)).has_location.includes_data
  end

  def self.most_recent_date
    uniq.order(date: :desc).limit(1).pluck(:date).pop
  end

  def self.start_date
    uniq.order(date: :asc).limit(1).pluck(:date).pop
  end

  def self.between_dates(number_of_months)
    most_recent_date = Date.parse(self.most_recent_date)
    start_date = most_recent_date.prev_month(number_of_months)
    start_date.strftime("%FT%T")..most_recent_date.strftime("%FT%T")
  end

  def self.has_location
    where.not(latitude: 0.0)
  end

  def self.includes_data
    select([
      :cause,
      :cyclists_injured,
      :cyclists_killed,
      :date,
      :latitude,
      :longitude,
      :pedestrians_injured,
      :pedestrians_killed,
      :vehicle_type
    ])
  end
end
