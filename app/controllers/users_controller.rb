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
          @user = User.new(user_params)
          @user.save
          if @user.valid?
            redirect_to user_path(@user)
          else
            render :new
          end
        end



        private

        def user_params
          params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password)
        end
end
