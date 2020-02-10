class ParkingZone < ApplicationRecord
    has_many :spaces

    def available_space
    end
end
