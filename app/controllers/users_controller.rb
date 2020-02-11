class UsersController < ApplicationController
        
    def index
          @users = User.all
        end

        def show
          @user = User.find(params[:id])
        end

        def new
          @user = User.new
        end

        def create
          # Create user here
          @user = User.create(user_params)
          redirect_to user_path(@user)
        end

        def destroy
          @user = User.find(params[:id])
          @user.destroy
          redirect_to pets_path
        end

        private

        def user_params
          params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password)
        end
end
