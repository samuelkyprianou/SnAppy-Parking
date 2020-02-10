class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :number_plate

      t.timestamps
    end
  end
end
