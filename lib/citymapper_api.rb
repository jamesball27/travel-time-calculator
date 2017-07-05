class CitymapperApi

  include HTTParty

  def self.get_travel_time(start_coord, end_coord, time)
    url = "https://developer.citymapper.com/api/1/traveltime/"

    params = {
      startcoord: start_coord,
      endcoord: end_coord,
      time: time,
      time_type: "arrival",
      key: ENV["citymapper_api_key"]
    }

    response = JSON.parse get(url, query: params).to_s
    response["travel_time_minutes"]
  end

end
