class ChangeIncidentsLatitudeAndLongitude < ActiveRecord::Migration
  def change
    change_column_null :incidents, :latitude, false
    change_column_null :incidents, :longitude, false
  end
end
