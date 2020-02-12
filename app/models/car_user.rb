class CarUser < ApplicationRecord
    belongs_to :user 
    belongs_to :car
    has_many :tickets, dependent: :destroy
    has_many :spaces, through: :tickets

    def active_tickets
       arr = self.tickets.where(active: true)
        arr.order("(created_at) DESC")
    end

    def most_recent_tickets(limit=5)
        tickets
      .where("tickets.id")
      .order("(tickets.id) DESC")
      .limit(limit)
    end
end
