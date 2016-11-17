require 'oystercard'
require 'station'

describe Oystercard do

  let(:entry_station){ double(:entry_station) }
  let(:exit_station){ double(:exit_station) }

    it 'should test that oystercard is initialized with a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'should top up value of oyster card with given value' do
      subject.top_up(30)
      expect(subject.balance).to eq 30
    end

    it 'should raise an error if maximun balance is exceeded' do
      expect{subject.top_up(95)}.to raise_error "Maximum balance limit of £90 exceeded"
    end

    it "touches in the card" do
      pending "pending test"
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to be true
    end

    it "touches out the card" do
      pending "pending test"
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to be false
    end

    it "prevents customer from touching in when card is below minumum balance" do
      expect{subject.touch_in(entry_station)}.to raise_error "Not enough funds. Minimum is £1"
    end

    it "should deduct a minumum fare when touching out" do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
    end
    
end
