require './lib/journey_log.rb'

describe JourneyLog do

  subject(:journey_log) {described_class.new(Journey)}
  let(:entry_station) {double :station}
  let(:exit_station)  {double :station}

  context "Initializing" do
    it "should be able to access to a journey class through initializing" do
      expect(journey_log.journey).to eq Journey
    end

    it "should have an array to store all journeys" do
      expect(journey_log.journey_history).to eq []
    end

    it "should have an array to temp store current journey" do
      expect(journey_log.journey_tracker).to eq []
    end
  end

  context "Starting a new journey" do

    it "should save entry station to current journey" do
      journey_log.start(entry_station)
      expect(journey_log.journey_tracker).to eq ([["entry", entry_station]])
    end
  end

  context "Finishing a journey" do
    it "should save both entry and exit station to journey history" do
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(journey_log.journey_history).to eq ([{"entry"=>entry_station, "exit"=>exit_station}])
    end
  end

end
