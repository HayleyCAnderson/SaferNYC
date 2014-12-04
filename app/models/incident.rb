class Incident < ActiveRecord::Base
  geocoded_by :cross_streets
  after_validation :geocode, if: ->(incident){ incident.latitude == 0.0 }

  def cross_streets
    "#{on_street_name} and #{cross_street_name}, #{borough}, NY #{zip_code}"
  end

  def geojson
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [longitude, latitude]
      },
      properties: {
        "title" => date,
        "marker-size" => "small",
        "marker-color" => "#0044FF"
      }
    }
  end

  def self.to_geojson
    all.map(&:geojson)
  end
end
