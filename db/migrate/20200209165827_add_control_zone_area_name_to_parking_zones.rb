class AddControlZoneAreaNameToParkingZones < ActiveRecord::Migration[6.0]
  def change
    add_column :parking_zones, :control_zone, :string
    add_column :parking_zones, :area_name, :string
    remove_column :parking_zones, :name
  end
end
