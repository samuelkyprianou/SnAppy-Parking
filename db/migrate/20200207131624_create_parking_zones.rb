class CreateParkingZones < ActiveRecord::Migration[6.0]
  def change
    create_table :parking_zones do |t|
      t.string :name

      t.timestamps
    end
  end
end
