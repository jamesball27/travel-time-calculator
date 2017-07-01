
class TravelTime

  def self.all(params)
    start_coords = '51.520032,-0.0989399'

    travel_times = []
    time = params["departure_time"]
    destinations = params["destinations"]

    destinations.values.each do |destination|
      end_coords = destination["coords"]
      travel_time = CitymapperApi.get_travel_time(start_coords, end_coords, time)

      start_coords = end_coords
      time = (Time.parse(time) + (travel_time * 60)).strftime("%Y-%m-%dT%H:%M")

      travel_time_params = {
        address: destination["address"],
        arrival_time: time
      }

      travel_times << TravelTime.new(travel_time_params)
    end

    travel_times
  end

  def initialize(params)
    @address = params[:address]
    @arrival_time = params[:arrival_time]
  end

end
