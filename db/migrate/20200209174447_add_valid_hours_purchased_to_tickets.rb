class AddValidHoursPurchasedToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :active, :boolean
    add_column :tickets, :hours_purchased, :integer
  end
end
