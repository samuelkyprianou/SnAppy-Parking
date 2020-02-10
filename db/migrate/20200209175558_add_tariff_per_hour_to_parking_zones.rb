class AddTariffPerHourToParkingZones < ActiveRecord::Migration[6.0]
  def change
    add_column :parking_zones, :tariff_per_hour, :integer
    remove_column :spaces, :tariff
  end
end
