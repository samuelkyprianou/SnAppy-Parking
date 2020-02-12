class ApplicationController < ActionController::Base
    require 'flash'

  helper_method :current_user, :authorize_user
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
  # Unless there is a user currently logged in, we set the flash hash to a message telling them to log in and redirec them to the login page.
  def authorize_user
    unless current_user
      flash[:notice] = "Sorry, you need to be logged in to access that feature"
      redirect_to new_session_path
    end
  end

  def user_cars?
    if current_user.car_users.empty?
      flash[:notice] = "Please register a car first!"
            redirect_to new_car_path
    end
  end
end
