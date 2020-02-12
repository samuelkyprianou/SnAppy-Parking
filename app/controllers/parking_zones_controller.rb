class ParkingZonesController < ApplicationController
    before_action :authorize_user, only: [:index, :show]
    
    def index
        @parking_zones = ParkingZone.all
    end
    
    def show
        @parking_zone = ParkingZone.find(params[:id])
    end
end
