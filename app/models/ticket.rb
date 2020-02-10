class Ticket < ApplicationRecord
    belongs_to :car_user
    belongs_to :space
end

