class Space < ApplicationRecord
    belongs_to :parking_zone
    has_many :tickets
    has_many :car_users, through: :tickets

    def active_space
        total = 0
        arr = Space.where(street_name: self.street_name)
        arr.map do |space|
        arr2 = space.tickets
        total += arr2.select { |ticket| ticket.active == true }.count
        end
        arr.count - total
    end
   
end
