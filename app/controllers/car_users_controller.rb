class CarUsersController < ApplicationController
    def show
        @car_user = CarUser.find(params[:id])   
    end 

end
