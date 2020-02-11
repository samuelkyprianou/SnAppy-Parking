class CarsController < ApplicationController

    def new
    @car = Car.new
    end

    def create
        @car = Car.find_by(registration_plate: params[:car][:registration_plate])
        if @car
            @car_user = CarUser.create(car_id: @car.id, user_id: current_user.id)
            redirect_to car_user_path(@car_user.id)
        else
        @car = Car.new(car_params)
        @car.save
        if @car.valid?
        @car_user = CarUser.create(car_id: @car.id, user_id: current_user.id)
        redirect_to car_user_path(@car_user.id)
        else
            render :new
        end
    end
end


    private

    def car_params
        params.require(:car).permit(:make, :model, :colour, :registration_plate)
      end

    
end
