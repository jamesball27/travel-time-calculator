require 'rails_helper'

describe JourneySegment do

  let(:params) {
    {
      departure_time: "2017-07-12T10:24",
      destination: "63 Oxford Street, London, United Kingdom",
      start_coords: "51.5161118,-0.13303289999998924",
      end_coords: "51.4972074,-0.1385334999999941"
    }
  }

  subject(:journey_segment) { JourneySegment.new(params) }

  describe "#arrival_time" do
    it "formats input as '%l:%M %p %m-%d-%Y'" do
      VCR.use_cassette("journey_segment/arrival_time") do
        expect(journey_segment.arrival_time).to eq("2017-12-07T10:43")
      end
    end
  end

  describe "#travel_time" do
    it "returns the travel time from API call" do
      VCR.use_cassette("journey_segment/travel_time") do
        expect(journey_segment.travel_time).to eq(19)
      end
    end
  end

  context "API fails" do
    it "returns nil" do
      VCR.use_cassette("journey_segment/api_fail") do
        ENV["citymapper_api_key"] = nil
        expect(journey_segment.travel_time).to be nil
      end
    end
  end
end
