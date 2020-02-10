class Space < ApplicationRecord
    belongs_to :parking_zone
    has_many :tickets
    has_many :car_users, through: :tickets




end
