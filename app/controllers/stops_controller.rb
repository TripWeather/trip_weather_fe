class StopsController < ApplicationController
  before_action :require_user

  def edit
    @trip_id = params[:trip_id]
    @address_id = params[:address_id]
    @stop_id = params[:stop_id]
  end

  def update
    address = address_format(params)
    TripFacade.update_address(@user.google_id, params[:trip_id],
                              params[:address_id], address, params[:stop_id])
    redirect_to "/trips/#{params[:trip_id]}"
  end

end