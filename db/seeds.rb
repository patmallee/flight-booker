# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  @code = ""
  3.times do
    @code += ('A'..'Z').to_a.sample
  end
  Airport.create(code: @code)
end

20.times do
  departure_time = Time.now+(rand(10).days)
  duration = (1..5).to_a.sample
  from_port = (1..20).to_a.sample
  to_port = (1..20).to_a.sample
  Flight.create(depart_time: departure_time, duration: duration,
                from_airport_id: from_port, to_airport_id: to_port)
end