class Space < ApplicationRecord
    belongs_to :parking_zone
    has_many :tickets
    has_many :car_users, through: :tickets


    def number_active_spaces
        total = 0
        arr = Space.where(street_name: self.street_name)
        arr.map do |space|
        arr2 = space.tickets
        total += arr2.select { |ticket| ticket.active == true }.count
        end
        arr.count - total
    end

    def self.available_spaces(array)
        space_instance = []
        array.each do |space|
            if space.tickets.empty?
                space_instance << space
            elsif space.tickets.select { |ticket| ticket.active == true }.empty?
                space_instance << space
            end
        end
        space_instance
    end


   

end
