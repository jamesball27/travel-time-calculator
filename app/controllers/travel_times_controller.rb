class TravelTimesController < ApplicationController

  def new
  end

  def create
    @travel_times = TravelTime.parse(travel_time_params)
    render :show
  end

  private

  def travel_time_params
    params.require(:travel_times)
      .permit(:departure_time, destinations: [:address, :coords])
  end

end
