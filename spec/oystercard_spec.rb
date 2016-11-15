require "oystercard"

describe Oystercard do

it "should respond to balance" do
  expect(subject).to respond_to(:balance)
end

it "should expect the balance to equal zero for a new card" do
  expect(subject.balance).to eq(0)
end

it "should respond to 'top_up'" do
  expect(subject).to respond_to(:top_up)
end

it "should expect the balance to increase when card is topped up" do
  subject.top_up(10)
  expect(subject.balance).to eq 10
end

end
