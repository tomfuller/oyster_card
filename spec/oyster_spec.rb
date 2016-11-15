require 'oyster'

describe Oyster do
  subject(:card) {described_class.new}

  describe "Balance" do
    it "should display zero when object is initialized" do
      expect(card.balance).to eq 0
    end
    it "should add 10 to the balance" do
      card.top_up(10)
      expect(card.balance).to eq 10
    end

    it "should raise an error if we add more than 90 to the balance" do
      message = "The limit for topping up is 90 pounds"
      expect{card.top_up(91)}.to raise_error(message)
    end
  end


end
