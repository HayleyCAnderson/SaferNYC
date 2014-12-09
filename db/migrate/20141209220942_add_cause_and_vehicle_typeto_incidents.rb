class AddCauseAndVehicleTypetoIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :cause, :string
    add_column :incidents, :vehicle_type, :string
  end
end
