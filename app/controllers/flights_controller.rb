class FlightsController < ApplicationController
  
  def index
    @flight = Flight.new
    @airports = Airport.all.map { |port| [port.code, port.id] }
    @departures = Flight.select(:depart_time).distinct.map { |date| [date.depart_time.strftime("%b %d, %Y - %l:%M %P"), date] }
  end
  
end
