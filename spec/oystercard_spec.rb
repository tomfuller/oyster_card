require 'oystercard'
require 'station'

describe Oystercard do
  let(:oystercard) { described_class.new(JourneyLog)}
  let(:entry_station){ double(:entry_station) }
  let(:exit_station){ double(:exit_station) }

    it 'should test that oystercard is initialized with a balance of 0' do
      expect(oystercard.balance).to eq 0
    end

    it 'should top up value of oyster card with given value' do
      oystercard.top_up(30)
      expect(oystercard.balance).to eq 30
    end

    it 'should raise an error if maximun balance is exceeded' do
      expect{oystercard.top_up(95)}.to raise_error "Maximum balance limit of £90 exceeded"
    end

    it "touches in the card" do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      expect(oystercard.journey_log.journey_started?).to be true
    end

    it "touches out the card" do
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey_log.journey_ended?).to be true
    end

    it "prevents customer from touching in when card is below minumum balance" do
      expect{oystercard.touch_in(entry_station)}.to raise_error "Not enough funds. Minimum is £1"
    end

    it "should deduct a minumum fare when touching out" do
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-1)
    end

end
