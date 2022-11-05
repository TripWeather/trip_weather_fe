class TripsController < ApplicationController
  before_action :require_user

  def show
    @trip = TripFacade.trip_by_id(@user.google_id, params[:id])
    binding.pry #I was trying to hit this pry but havent been able too
  end
end