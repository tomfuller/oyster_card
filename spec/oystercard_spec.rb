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

it "should raise an error when a top up takes the balance over 90" do
  subject.top_up(Oystercard::MAXIMUM_BALANCE)
  expect { subject.top_up(1) }.to raise_error("Top up too much. Maximum balance is £90. Current
  balance is #{subject.balance}")
end
end
