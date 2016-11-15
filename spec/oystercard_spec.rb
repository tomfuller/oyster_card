require "oystercard"

describe Oystercard do

it "should respond to balance" do
expect(subject).to respond_to(:balance)
end

it "should expect the balance to equal zero for a new card" do
expect(subject.balance).to eq(0)
end

end
