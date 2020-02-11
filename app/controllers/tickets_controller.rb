class TicketsController < ApplicationController
    before_action :create_new_ticket?, only: [:new] 


    def show
        @ticket = Ticket.find(params[:id])
    end
    
    def new
        @ticket = Ticket.new
        all_spaces = Space.where(street_name: params[:street_name])
        @available_spaces = Space.available_spaces(all_spaces)
        @space = @available_spaces.first
    end
  
    def create
      
    end


    private
    def create_new_ticket?
        all_spaces = Space.where(street_name: params[:street_name])
        @available_spaces = Space.available_spaces(all_spaces)
        if @available_spaces.empty?
          flash[:notice] = "Sorry, there are no available spaces at this time."
          redirect_to parking_zone_path(params[:parking_zone_id]), notice: flash[:notice]
        end
      end


end
