require 'journey_log'

describe JourneyLog do

  let(:journey_log) { described_class.new(Journey) }
  let(:station) { double(:station) }

  it 'should test that journey log is initiliazes with an argument class' do
    expect(journey_log.journey).to be_instance_of(Journey)
  end

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
end
