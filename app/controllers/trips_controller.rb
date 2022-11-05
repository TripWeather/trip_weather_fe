class TripsController < ApplicationController
  before_action :require_user

  def show
    @trip = TripFacade.trip_by_id(@user.google_id, params[:id])
  end

  # def create
  #   new_trip = TripFacade.create_trip(params[:trip])
  #   redirect_to '/dashboard'
  # end
  #
  # private
  #
  # def trip_params
  #   params.require(:trip).permit(...)
  # end
end
