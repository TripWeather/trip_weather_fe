class TripsController < ApplicationController
  before_action :require_user

  def show
    @trip = TripFacade.trip_by_id(@user.google_id, params[:id])
  end
end