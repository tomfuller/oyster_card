require './lib/journey.rb'

describe Journey do

let(:journey) {described_class.new}

  context "Initializing" do
    it "should store a start point" do
      expect(journey.start).to eq false
    end

    it "should store an end point" do
      expect(journey.end).to eq false
    end
  end

  context "Starting and finishing the journey" do
    it "should change start to true when journey begins" do
      expect{journey.begin}.to change{journey.start}.from(false).to(true)
    end

    it "should change end to true when journey finishes" do
      expect{journey.finish}.to change{journey.end}.from(false).to(true)
    end
  end

    it "should return true when #start and #end are true" do
      journey.begin
      journey.finish
      expect(journey.complete?).to eq true
    end

  context "Calculating fare" do
    it "should return min fare when journey is complete" do
      journey.begin
      journey.finish
      expect(journey.fare).to eq Journey::MIN_FARE
    end

    it "should return penalty fare when journey is incomplete" do
      journey.begin
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end

end
