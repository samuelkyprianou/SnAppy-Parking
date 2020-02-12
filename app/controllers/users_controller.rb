class UsersController < ApplicationController
  before_action :authorize_user, only: [:show, :edit]
  before_action :users_profile?, only: [:show]
        
  

        def show
          @user = User.find(params[:id])
        end

        def new
          @user = User.new
        end

        def edit
          @user = User.find(params[:id])
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

        def update
          @user = User.find(params[:id])
          @user.update(user_params)
          if @user.valid?
            redirect_to user_path(@user)
          else
            render :edit
          end
        end



        private

        def user_params
          params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password)
        end

        def users_profile?
          unless User.find(params[:id]) == current_user
            flash[:notice] = "Unauthorized User Account"
            redirect_to user_path(current_user.id)
          end
        end

end
