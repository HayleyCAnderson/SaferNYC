class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :borough
      t.string :key, null: false
      t.string :date, null: false
      t.float :latitude
      t.float :longitude
      t.string :cross_street_name
      t.string :on_street_name
      t.integer :pedestrians_injured, null: false
      t.integer :pedestrians_killed, null: false
      t.integer :cyclists_injured, null: false
      t.integer :cyclists_killed, null: false
      t.string :zip_code

      t.timestamps
    end
  end
end
