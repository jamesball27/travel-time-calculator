
class TravelTime

  def self.all(params)
    starting_coords = '51.520032,-0.0989399'

    travel_times = []
    addresses = params["addresses"]
    coords = params["coords"]
    time = params["time"]

    coords.each do |destination, end_coords|
      travel_time = CitymapperApi.get_travel_time(starting_coords, coords, time)

      starting_coords = end_coords
      time = (Time.parse(time) + travel_time).strftime("%Y-%m-%dT%H:%M")

      travel_time_params = {
        address: addresses[destination],
        coords: end_coords,
        arrival_time: time
      }

      travel_times << TravelTime.new(travel_time_params)
    end

    travel_times
  end

  def initialize(params)
    @address = params[:address]
    @coords = params[:coords]
    @arrival_time = params[:arrival_time]
  end

end
