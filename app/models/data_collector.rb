require "soda/client"

class DataCollector
  def initialize
    @client = SODA::Client.new(
      domain: ENV["soda_domain"],
      app_token: ENV["soda_application_token"]
    )
  end

  def get_collisions
    @client.get(
      ENV["soda_dataset_identifier"],
      "$select" => incident_data_points.join(", "),
      "$where" => "#{has_lat_lng} AND (#{pedestrian_involved} OR #{cyclist_involved})",
      "$order" => "date DESC"
    )
  end

  private

  def incident_data_points
    [
      :unique_key,
      :date,
      :zip_code,
      :latitude,
      :longitude,
      :on_street_name,
      :off_street_name,
      :number_of_pedestrians_injured,
      :number_of_pedestrians_killed,
      :number_of_cyclist_injured,
      :number_of_cyclist_killed
    ]
  end

  def has_lat_lng
    "latitude IS NOT NULL AND longitude IS NOT NULL"
  end

  def pedestrian_involved
    "number_of_pedestrians_injured>0 OR number_of_pedestrians_killed>0"
  end

  def cyclist_involved
    "number_of_cyclist_injured>0 OR number_of_cyclist_killed>0"
  end
end
