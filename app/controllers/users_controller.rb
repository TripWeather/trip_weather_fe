class UsersController < ApplicationController
  before_action :require_user

  def show
    @trips = TripFacade.all_trips(@user.google_id)
  end
end
