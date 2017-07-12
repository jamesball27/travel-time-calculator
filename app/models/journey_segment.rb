class JourneySegment

  attr_reader :destination, :end_coords, :start_coords, :departure_time

  def initialize(params)
    @start_coords = params[:start_coords]
    @end_coords = params[:end_coords]
    @destination = params[:destination]
    @departure_time = format_depature_time(params[:departure_time])
  end

  def travel_time
    @travel_time ||= CitymapperApi.get_travel_time(start_coords, end_coords, departure_time)
  end

  def arrival_time
    @arrival_time ||= (Time.parse(departure_time) + (travel_time * 60)).strftime("%Y-%m-%dT%H:%M")
  end

  private
  
  def format_depature_time(departure_time)
    Time.parse(departure_time).strftime("%l:%M %p %m-%d-%Y")
  end

end
