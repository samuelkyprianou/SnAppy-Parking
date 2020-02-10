class AddMakeModelColourToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :make, :string
    add_column :cars, :model, :string
    add_column :cars, :colour, :string
    add_column :cars, :registration_plate, :string
    remove_column :cars, :number_plate
  end
end
