require 'journey_log'

describe JourneyLog do

  let(:journey_log) { described_class.new }
  let(:station) { double(:station) }

  it 'should test that method start, starts journey' do
    journey_log.start(station)
    expect(journey_log.journey.start_journey).to eq true
  end

  it 'should test current journey method, starts new journey' do
    journey_log.current_journey
    expect(journey_log.journey.start_journey).to eq true
  end

  it 'should test finish method, finishes journey' do
    journey_log.start(station)
    journey_log.finish(station)
    expect(journey_log.journey.end_journey).to eq true
  end

  it 'expects journey_history to contain a hash of stations' do
    journey_log.start(station)
    journey_log.finish(station)
    journey_log.save_journey_to_history
    expect(journey_log.journey_history).to eq [{"Entry Station" => station, "Exit Station" => station}]
  end

end
