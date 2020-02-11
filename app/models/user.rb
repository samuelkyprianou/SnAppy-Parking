class User < ApplicationRecord
    has_many :car_users
    has_many :cars, through: :car_users
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :first_name, presence: :true
    validates :last_name, presence: :true
    validates :user_name, presence: :true, uniqueness: :true

    def full_name
        self.first_name + ' ' + self.last_name
    end

    has_secure_password
end
