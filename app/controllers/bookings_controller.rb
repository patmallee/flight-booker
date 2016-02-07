class BookingsController < ApplicationController
  def new
    @flight = Flight.find(flight_params[:id])
    @booking = @flight.bookings.build
    @passenger_count = flight_params[:passengers][:count].to_i
    
    @passengers = []
    @passenger_count.times do |n|
      @passengers << Passenger.new
    end
  end
  
  def create
    booking = Booking.create!(booking_params)
    
    flash[:success] = "Flight booked successfully!"
    redirect_to 'show'
  end
  
  def show
    
  end
  
  private
  
    def flight_params
      params.require(:flight).permit(:id, passengers: [:count])
    end
    
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
  
end
