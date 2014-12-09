require "soda/client"

class DataCollector
  def initialize
    @client = SODA::Client.new(
      domain: ENV["soda_domain"],
      app_token: ENV["soda_application_token"]
    )
  end

  def collisions
    @client.get(
      ENV["soda_dataset_identifier"],
      "$select" => incident_data_points.join(", "),
      "$where" => incident_conditions,
      "$order" => "date DESC"
    )
  end

  private

  def incident_data_points
    [
      :borough,
      :contributing_factor_vehicle_1,
      :date,
      :latitude,
      :longitude,
      :number_of_cyclist_injured,
      :number_of_cyclist_killed,
      :number_of_pedestrians_injured,
      :number_of_pedestrians_killed,
      :off_street_name,
      :on_street_name,
      :unique_key,
      :vehicle_type_code1,
      :zip_code
    ]
  end

  def incident_conditions
    "#{is_new} AND #{has_location_data} AND #{is_relevant}"
  end

  def is_new
    "date>'#{date_of_last_saved_incident}'"
  end

  def has_location_data
    "(#{has_latitude_and_longitude} OR #{has_address_information})"
  end

  def is_relevant
    "(#{pedestrian_involved} OR #{cyclist_involved})"
  end

  def date_of_last_saved_incident
    if Incident.all.size > 0
      Incident.order(date: :desc).first.date
    else
      0
    end
  end

  def has_latitude_and_longitude
    "(latitude IS NOT NULL AND longitude IS NOT NULL)"
  end

  def has_address_information
    "(#{has_cross_streets} AND zip_code IS NOT NULL)"
  end

  def pedestrian_involved
    "number_of_pedestrians_injured>0 OR number_of_pedestrians_killed>0"
  end

  def cyclist_involved
    "number_of_cyclist_injured>0 OR number_of_cyclist_killed>0"
  end

  def has_cross_streets
    "(on_street_name IS NOT NULL AND off_street_name IS NOT NULL)"
  end
end
