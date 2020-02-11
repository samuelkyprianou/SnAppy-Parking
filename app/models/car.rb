class Car < ApplicationRecord
    has_many :car_users
    has_many :users, through: :car_users
    validates_format_of :registration_plate, { with: /(^[A-Z]{2}[0-9]{2} [A-Z]{3}$)/, message: "Invalid Registration Plate - Corret Format \"AA11 AAA\" " }
    validates :model, presence: :true
    validates :make, presence: :true
    validates :colour, presence: :true
end
