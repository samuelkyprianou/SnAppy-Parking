class CarUser < ApplicationRecord
    belongs_to :user 
    belongs_to :car
    has_many :tickets
    has_many :spaces, through: :tickets
end
