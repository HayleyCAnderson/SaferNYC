class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :key, null: false
      t.string :date, null: false
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.integer :pedestrians_injured, null: false
      t.integer :pedestrians_killed, null: false
      t.integer :cyclists_injured, null: false
      t.integer :cyclists_killed, null: false

      t.timestamps
    end
  end
end
