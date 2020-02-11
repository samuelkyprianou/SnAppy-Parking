class User < ApplicationRecord
    has_many :car_users
    has_many :cars, through: :car_users

    def full_name
        self.first_name + ' ' + self.last_name
    end

    has_secure_password
end
