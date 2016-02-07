class Passenger < ActiveRecord::Base
  belongs_to :flight
  belongs_to :booking

end
