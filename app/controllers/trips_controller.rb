class TripsController < ApplicationController
  before_action :require_user

  def show
    @trip = TripFacade.trip_by_id(@user.google_id, params[:id])
    @stops = StopsFacade.all_stops(@user.google_id, params[:id])
  end

  def index
    @trips = TripFacade.all_trips(@user.google_id)
  end

  def new
  end

  def create
    start_address = start_params(params)
    end_address = end_params(params)

    new_trip = TripFacade.create_trip(params[:name], @user.google_id,
                                      params[:departure_date], params[:arrival_date])
    trip_id = trip_id(new_trip.body)

    TripFacade.create_stops(trip_id, @user.google_id, start_address, params[:start_point] )
    TripFacade.create_stops(trip_id, @user.google_id, end_address, params[:end_point])
    flash[:success] = "You've Created a New Adventure!"
    redirect_to '/trips'
  end

  def destroy
    TripFacade.delete_trip(@user.google_id, params[:id])
    flash[:success] = "Trip has been Cancelled"
    redirect_to '/trips'
  end

  def edit
    @trip = TripFacade.trip_by_id(@user.google_id, params[:id])
  end

  def update
    # @trip = TripFacade.trip_by_id(@user.google_id, params[:id])

    TripFacade.update_trip(params[:id], params[:name], @user.google_id,
    params[:departure_date], params[:arrival_date])
    flash[:success] = "You've Updated Your Adventure"
    redirect_to "/trips/#{params[:id]}"
  end

  private

  def new_trip_params
    params.permit(:name, @user.google_id, :departure_date, :arrival_date)
  end

  def create_address(address_params)
   "#{address_params[0]}, #{address_params[1]}, #{address_params[2]} #{address_params[3]}"
  end

  def start_params(params)
    create_address([params[:start_address], params[:start_city],
                    params[:start_state], params[:start_zipcode]])
  end

  def end_params(params)
    create_address([params[:end_address], params[:end_city],
      params[:end_state], params[:end_zipcode]])
  end

  def trip_id(data)
    response = JSON.parse(data, symbollize_name: true)
    response["data"]["id"]
  end
end
