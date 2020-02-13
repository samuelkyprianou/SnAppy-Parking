class CarUser < ApplicationRecord
    belongs_to :user 
    belongs_to :car
    has_many :tickets, dependent: :destroy
    has_many :spaces, through: :tickets

    def active_tickets
       arr = self.tickets.where(active: true)
        arr.order("(created_at) DESC")
    end

    def expired_tickets
      arr = self.tickets.where(active: false)
        arr.order('created_at DESC').take(5) 
    end
end
