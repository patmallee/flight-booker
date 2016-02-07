class BookingsController < ApplicationController
  def new
    @flight = Flight.find(booking_params[:id])
    @booking = @flight.bookings.build
    @passenger_count = params[:passengers][:count].to_i
    
    @passengers = []
    @passenger_count.times do |n|
      @passengers << Passenger.new
    end
  end
  
  def create
    redirect_to root_path
  end
  
  private
  
    def booking_params
      params.require(:flight).permit(:id, passengers: [:count])
    end
  
end
