class ParkingZonesController < ApplicationController
    def index
        @parking_zones = ParkingZone.all
    end
    
    def show
        @parking_zone = ParkingZone.find(params[:id])
    end
end
