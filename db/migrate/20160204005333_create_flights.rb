class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :depart_time
      t.time :duration
      t.integer :from_airport_id
      t.integer :to_airport_id

      t.timestamps null: false
    end
  end
end
