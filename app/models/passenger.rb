class Passenger < ActiveRecord::Base
  belongs_to :flight, through: :booking
  belongs_to :booking

end
