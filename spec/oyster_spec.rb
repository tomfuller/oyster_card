require 'oyster'

describe Oyster do
  subject(:card) {described_class.new}

  describe "Balance" do
    it "should display zero when object is initialized" do
      expect(card.balance).to eq 0
    end

    context "when the balance exceeds its limits, should raise an error" do

      it " if we add more than 90 to the balance" do
        message = "The limit for topping up is 90 pounds"
        expect{card.top_up(91)}.to raise_error(message)
      end

      it " if we try to deduct more then we have on the balance" do
        message = "You're poor, go and top up"
        expect{card.deduct(10)}.to raise_error(message)
      end
    end
  end

  describe "will change, " do
    before(:each) {card.top_up(10)}
    it "should add 10 to the balance" do
      expect(card.balance).to eq 10
    end

    it "should deduct 10 from the balance" do
      card.deduct(5)
      expect(card.balance).to eq 5
    end

  end


end
