class Ticket < ApplicationRecord
    belongs_to :car_user
    belongs_to :space

    def expiration
        self.created_at + self.hours_purchased.hours
    end

    def user 
        self.car_user.user
    end

    def car
        self.car_user.car
    end

    def ticket_amount
        self.space.parking_zone.tariff_per_hour * self.hours_purchased
    end
end

