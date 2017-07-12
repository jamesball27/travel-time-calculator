class TravelTime
  DEFAULT_START_COORDS = '51.520032,-0.0989399' # Rentify, London

  attr_reader :destinations
  attr_accessor :start_coords, :departure_time

  def self.parse(travel_time_params)
    new(travel_time_params).parse
  end

  def initialize(travel_time_params)
    @start_coords = DEFAULT_START_COORDS
    @departure_time = travel_time_params["departure_time"]
    @destinations = travel_time_params["destinations"].values
  end

  def parse
    travel_times = []
    start_coords = @start_coords
    departure_time = @departure_time 

    destinations.each do |destination|
      end_coords = destination["coords"]

      journey_segment_params = {
        start_coords: start_coords,
        end_coords: end_coords,
        destination: destination["address"],
        departure_time: departure_time, #time depart from previous destination
      }

      journey_segment = JourneySegment.new(journey_segment_params)
      travel_times << journey_segment
      return nil unless journey_segment.travel_time

      start_coords = journey_segment.end_coords
      departure_time = journey_segment.arrival_time
    end

    travel_times
  end

end
