class FlightsController < ApplicationController
  
  def index
    @flight = Flight.new
    @airports = Airport.all.map { |port| [port.code, port.id] }
    @departures = Flight.distinct.pluck(:depart_time).map { |date| [date.strftime("%b %d, %Y - %l:%M %P"), date] }
  
    unless params[:flight].nil?
      @search_results = Flight.where("depart_time >= ? AND from_airport_id = ? AND 
                                      to_airport_id = ?", search_params[:depart_time], 
                                      search_params[:from_airport_id], search_params[:to_airport_id])
      @passenger_count = search_params[:passengers][:count]
    end
  end
  
  private
  
    def searched
      @searched = true
    end
  
    def search_params
      params.require(:flight).permit(:depart_time, :from_airport_id, :to_airport_id,
                                     passengers: [:count])
    end
  
end
