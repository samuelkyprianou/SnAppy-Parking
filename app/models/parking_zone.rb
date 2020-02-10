class ParkingZone < ApplicationRecord
    has_many :spaces

    def unique_street_names
        # self.spaces.map { |space| space.street_name }.uniq
        self.spaces.group(:street_name)
    end
end
