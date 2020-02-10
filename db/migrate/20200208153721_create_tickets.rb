class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :car_user_id
      t.integer :space_id

      t.timestamps
    end
  end
end
