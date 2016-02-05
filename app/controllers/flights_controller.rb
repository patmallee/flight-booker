class FlightsController < ApplicationController
  
  def index
    @flight = Flight.new
    @airports = Airport.all.map { |port| [port.code, port.id] }
    @departures = Flight.select(:depart_time).distinct.map { |date| [date.depart_time.strftime("%b %d, %Y - %l:%M %P"), date] }
  
    @search_results = Flight.where("depart_time >= ? AND from_airport_id = ? AND 
                                    to_airport_id = ?", search_params[:depart_time], 
                                    search_params[:from_airport_id], search_params[:to_airport_id])
    @passenger_count = search_params[:passengers][:count]
  end
  
  private
  
    def search_params
      params.require(:flight).permit(:depart_time, :from_airport_id, :to_airport_id,
                                     passengers: [:count])
    end
  
end
