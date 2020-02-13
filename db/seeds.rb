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
  obj["parking_spaces"].to_i.times { Space.create(parking_zone_id: pz.id, street_name: obj["road_name"], post_code: obj["postcode"],  operational_hours: obj["times_of_operation"], longitude: obj["longitude"], latitude: obj["latitude"]) }
end

