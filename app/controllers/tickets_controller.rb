class TicketsController < ApplicationController


    def show
        @ticket = Ticket.find(params[:id])
    end

    def new
        @ticket = Ticket.new
        @spaces = Space.where(street_name: params[:street_name])
    end
  
    def create
      
    end
end
