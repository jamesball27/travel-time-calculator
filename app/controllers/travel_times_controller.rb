class TravelTimesController < ApplicationController

  def show
  end

  def create
    
  end

  private

  def travel_time_params
    params.require(:travel_time).permit(:time, :addresses, :coords)
  end
end
