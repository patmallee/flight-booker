class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
  
  has_many :passengers, through: :bookings
  has_many :bookings
  
end
