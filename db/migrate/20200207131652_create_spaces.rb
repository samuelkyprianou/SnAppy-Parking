class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.integer :parking_zone_id
      t.string :street_name

      t.timestamps
    end
  end
end
