class AddIndexToIncidents < ActiveRecord::Migration
  def change
    add_index :incidents, :date
  end
end
