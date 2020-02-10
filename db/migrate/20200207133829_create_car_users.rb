class CreateCarUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :car_users do |t|
      t.integer :car_id
      t.integer :user_id

      t.timestamps
    end
  end
end
