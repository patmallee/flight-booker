class RemoveDurationFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :duration, :time
  end
end
