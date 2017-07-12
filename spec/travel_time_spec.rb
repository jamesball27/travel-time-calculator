require 'rails_helper'

# ActiveSupport::HashWithIndifferentAccess.new
describe TravelTime do
  let(:params) {
    {
      "departure_time" => "2017-07-12T10:24",
      "destinations" => {
        "0" => {
          "address"=>"63 Oxford Street, London, United Kingdom",
          "coords"=>"51.5161118,-0.13303289999998924"
        },
        "1" => {
          "address"=>"72 Victoria Street, London, United Kingdom",
          "coords"=>"51.4972074,-0.1385334999999941"
        }
      }
    }
  }

  subject(:travel_time_array) { TravelTime.parse(params) }
  before :each do
    allow_any_instance_of(JourneySegment).to receive(:travel_time).and_return 40
  end

  describe "::parse" do
    it "outputs an array" do
      expect(travel_time_array).to be_a(Array)
    end

    it "outputs array of JourneySegment objects" do
      all_travel_times = travel_time_array.all? { |el| el.is_a?(JourneySegment) }
      expect(all_travel_times).to be true
    end

    context "API fails" do
      it "returns nil" do
        allow_any_instance_of(JourneySegment).to receive(:travel_time).and_return nil
        expect(TravelTime.parse(params)).to be nil
      end
    end
  end

  # test specific inputs/outputs
end
