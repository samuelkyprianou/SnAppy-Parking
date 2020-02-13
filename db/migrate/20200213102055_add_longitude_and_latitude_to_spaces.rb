class AddLongitudeAndLatitudeToSpaces < ActiveRecord::Migration[6.0]
  def change
    add_column :spaces, :longitude, :float
    add_column :spaces, :latitude, :float
  end
end
