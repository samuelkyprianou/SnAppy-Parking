# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'JSON'
require 'open-uri'

area_name = {
    "CA-B"=>"Belsize",
    "CA-C"=>"Holborn & Covent Garden",
    "CA-D"=>"Kings Cross",
    "CA-E"=>"Bloomsbury & Fitzrovia",
    "CA-F"=>"Camden Town",
    "CA-G"=>"Somers Town",
    "CA-H"=>"Hampstead",
    "CA-J"=>"Primrose Hill",
    "CA-K"=>"Killburn",
    "CA-L"=>"Kentish Town(West)",
    "CA-M"=>"Kentish Town(East)",
    "CA-N"=>"Camden Square",
    "CA-P"=>"Fortune Green",
    "CA-Q"=>"Kilburn",
    "CA-R"=>"Swiss Cottage",
    "CA-S"=>"Redington & Frognal",
    "CA-U"=>"Highgate",
    "CA-V"=>"North End",

}


json = File.read('7hiv-3r9k.json')
objs = JSON.parse(json)
objs.each do |obj|
   pz = ParkingZone.find_by(control_zone: obj["controlled_parking_zone"])
   if !pz
    pz = ParkingZone.create(control_zone: obj["controlled_parking_zone"], area_name: area_name[obj["controlled_parking_zone"]], tariff_per_hour: [2, 4, 6].sample)
  end 
  obj["parking_spaces"].to_i.times { Space.create(parking_zone_id: pz.id, street_name: obj["road_name"], post_code: obj["postcode"],  operational_hours: obj["times_of_operation"]) }
end


a = User.create(user_name: "Jeff", email: "J@test.com", first_name: "Jeff", last_name: "Test")
b = User.create(user_name: "Jim", email: "T@test.com", first_name: "Jim", last_name: "Test")

c = Car.create(make: "Tesla", model: "Roadster", colour: "Red", registration_plate: "AB10CD")
d = Car.create(make: "Vauxhall", model: "Corsa", colour: "Blue", registration_plate: "ZV99XD")

e = CarUser.create(car_id: c.id, user_id: a.id)
f = CarUser.create(car_id: c.id, user_id: b.id)
g = CarUser.create(car_id: d.id, user_id: a.id)

Ticket.create(car_user_id: e.id, space_id: Space.fifth.id, active: false, hours_purchased: 1)
Ticket.create(car_user_id: e.id, space_id: Space.fourth.id, active: false, hours_purchased: 4)
Ticket.create(car_user_id: e.id, space_id: Space.last.id, active: false, hours_purchased: 2)
Ticket.create(car_user_id: e.id, space_id: Space.first.id, active: true, hours_purchased: 3)
Ticket.create(car_user_id: e.id, space_id: Space.find(30).id, active: true, hours_purchased: 4)
Ticket.create(car_user_id: e.id, space_id: Space.find(29).id, active: false, hours_purchased: 4)
Ticket.create(car_user_id: e.id, space_id: Space.find(33).id, active: true, hours_purchased: 3)
Ticket.create(car_user_id: e.id, space_id: Space.find(38).id, active: true, hours_purchased: 4)
Ticket.create(car_user_id: e.id, space_id: Space.forty_two.id, active: true, hours_purchased: 4)
Ticket.create(car_user_id: e.id, space_id: Space.forty_two.id, active: false, hours_purchased: 3)