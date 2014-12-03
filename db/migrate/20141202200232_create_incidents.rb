class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :key, null: false
      t.string :date, null: false
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.boolean :pedestrian_casualties, null: false
      t.boolean :cyclist_casualties, null: false

      t.timestamps
    end
  end
end
