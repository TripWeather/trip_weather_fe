class UsersController < ApplicationController
  
  def new
  end

  def create
    if params[:image].nil?
      params[:image] = nil #return plain user shadow
    end
    @user = TripWeatherFacade.new_user(params)
    #create a session_controller.new
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :full_name, :image, :email)
  end

end