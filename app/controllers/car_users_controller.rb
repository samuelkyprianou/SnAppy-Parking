class CarUsersController < ApplicationController
    before_action :authorize_user, only: [:show, :destroy]

    def show
        @car_user = CarUser.find(params[:id])   
    end 


    def destroy
        CarUser.destroy(params[:id])
        redirect_to user_path(current_user.id)
    end

end
