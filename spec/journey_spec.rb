require 'journey'

describe Journey do

  let(:journey) { described_class.new }

  context 'initialization tests' do

      it 'should initialize with an instance variable "start_journey"' do
        expect(journey.start_journey).to eq false
      end

      it 'should initialize with an instance variable "end_journey"' do
        expect(journey.end_journey).to eq false
      end

  end

  context 'start, end and complete journey tests' do

    it 'should test that journey_start method changes start_journey to true' do
      journey.journey_start
      expect(journey.start_journey).to eq true
    end

    it 'should test that journey_end method changes end_journey to true' do
      journey.journey_end
      expect(journey.end_journey).to eq true
    end

    it 'should test that a journey has been completed' do
      journey.journey_start
      journey.journey_end
      expect(journey.journey_complete?).to eq true
    end

  end

  context 'fare calculation' do

    it "should return #{Journey::MINIMUM_FARE} when journey is completed" do
      journey.journey_start
      journey.journey_end
      expect(journey.calculate_fare).to eq (1)
    end

    it "should return #{Journey::PENALTY_FARE} when journey is incomplete" do
      journey.journey_start
      expect(journey.calculate_fare).to eq (6)
    end

  end





end
