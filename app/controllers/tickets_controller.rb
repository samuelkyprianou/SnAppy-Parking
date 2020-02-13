class TicketsController < ApplicationController
  before_action :authorize_user, only: [:show, :new, :create]
    before_action :create_new_ticket?, only: [:new] 


    def show
        @ticket = Ticket.find(params[:id])
    end
    
    def new
        @ticket = Ticket.new
        all_spaces = Space.where(street_name: params[:street_name])
        @available_spaces = Space.available_spaces(all_spaces)
        @space = @available_spaces.first
        @user = User.find(current_user.id)
    end
  
    def create
        @car_user = CarUser.find_by(car_id: params[:car][:car_id], user_id: session[:user_id])
        @ticket = Ticket.create(car_user_id: @car_user.id, space_id: params[:ticket][:space_id], hours_purchased: params[:ticket][:hours_purchased], active: true)
        redirect_to ticket_path(@ticket.id)
        
    end


    private


    def ticket_params
        params.require(:ticket).permit(:hours_purchased, :car_id, :space_id)
      end


    def create_new_ticket?
        all_spaces = Space.where(street_name: params[:street_name])
        @available_spaces = Space.available_spaces(all_spaces)
        if @available_spaces.empty?
          flash[:notice] = "Sorry, there are no available spaces at this time."
          redirect_to parking_zone_path(params[:parking_zone_id])
        end
      end


end
