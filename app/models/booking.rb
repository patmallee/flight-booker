class Booking < ActiveRecord::Base
  has_one :flight
  has_one :passenger

end
