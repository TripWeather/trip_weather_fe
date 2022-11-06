class TripsController < ApplicationController
  before_action :require_user

  def show
    @trip = TripFacade.trip_by_id(@user.google_id, params[:id])
  end

  def index
    @trips = TripFacade.all_trips(@user.google_id)
  end

  def new
  end

  def create
    new_trip = TripFacade.create_trip(params[:name], @user.google_id, params[:departure_date].to_datetime)
    flash[:success] = "You've Created a New Adventure!"
    redirect_to '/trips'
  end
  
  private
  
  def new_trip_params
    params.permit(:departure_date, :name, @user.google_id)
  end
end
