class TravelTimesController < ApplicationController

  def show
  end

  def create
    @travel_times = TravelTime.all(travel_time_params)
    render :show
  end

  private

  def travel_time_params
    params.require(:travel_times)
      .permit(:departure_time, destinations: [:address, :coords])
  end

end
