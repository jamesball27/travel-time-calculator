
class TravelTime

  def self.parse(travel_time_params)
    travel_times = []

    start_coords = '51.520032,-0.0989399'
    time = travel_time_params["departure_time"]
    destinations = travel_time_params["destinations"].values

    destinations.each do |destination|
      debugger
      end_coords = destination["coords"]
      travel_time = CitymapperApi.get_travel_time(start_coords, end_coords, time)

      start_coords = end_coords
      time = (Time.parse(time) + (travel_time * 60)).strftime("%Y-%m-%dT%H:%M")

      params = {
        address: destination["address"],
        arrival_time: time,
        travel_time: travel_time
      }

      travel_times << TravelTime.new(params)
    end

    travel_times
  end

  attr_reader :address, :arrival_time, :travel_time

  def initialize(params)
    @address = params[:address]
    @arrival_time = Time.parse(params[:arrival_time]).strftime("%l:%M %p %m-%d-%Y")
    @travel_time = params[:travel_time]
  end

end
