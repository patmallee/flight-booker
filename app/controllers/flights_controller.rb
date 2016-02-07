class FlightsController < ApplicationController
  
  def index
    @flight = Flight.new
    @selected_flight = Flight.new
    @airports = Airport.all.map { |port| [port.code, port.id] }
    @departures = Flight.pluck(:depart_time).sort.map { |date| [date.strftime("%b %d, %Y - %l:%M %P"), date] }

    @passenger_count_options = []
    (1..4).each do |n|
      @passenger_count_options << ["#{n}", n]
    end

    unless params[:flight].nil?
      @search_results = Flight.where("depart_time >= ? AND from_airport_id = ? AND 
                                      to_airport_id = ?", search_params[:depart_time], 
                                      search_params[:from_airport_id], search_params[:to_airport_id])
      @passenger_count = search_params[:passengers][:count]
      @passenger_count.to_i
    end
  end
  
  def new
    
  end
  
  private
  
    def searched
      @searched = true
    end
  
    def search_params
      params.require(:flight).permit(:depart_time, :from_airport_id, :to_airport_id,
                                     passengers: [:count], booking: [:selection])
    end
    
end
