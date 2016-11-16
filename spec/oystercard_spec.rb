require "oystercard"

describe Oystercard do

let(:station) { double :station }

context "Create a basic Oystercard" do

it "should expect the balance to equal zero for a new card" do
  expect(subject.balance).to eq(0)
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


it "should expect the balance to decrease when a fare is charged" do
  subject.top_up(20)
  expect{subject.touch_out}.to change{subject.balance}.by(-1)
end
end

context "Add touch-in touch-out functionality" do

it "should respond to 'in_journey'" do
  expect(subject).to respond_to(:in_journey?)
end

it "should respond to 'touch_in'" do
  expect(subject).to respond_to(:touch_in)
end

it "should be in a journey after touching in" do
subject.top_up(10)
subject.touch_in(station)
expect(subject.in_journey).to be true
end

it "should respond to 'touch_out'" do
  expect(subject).to respond_to(:touch_out)
end

it "should be in a journey after touching out" do
subject.touch_out
expect(subject.in_journey).to be false
end

it "on touch in it should report an error
when the balance is below the minimum amount" do
expect{ subject.touch_in(station) }.to raise_error("You do not have sufficient funds. Please top up your card.")
end

it "on touch out it should charge the card the minimum fare" do
subject.top_up(6)
expect{subject.touch_out}.to change{subject.balance}.by(-1)
end
end

context "Record the journeys"

it "An Oystercard should respond to station and return the station" do
  expect(subject).to respond_to(:entry_station)
end

it "touch in should have an argument" do
  expect(subject).to respond_to(:touch_in).with(1).argument
end

it "on touch in the station will be updated" do
  subject.top_up(10)
  subject.touch_in(station)
  expect(subject.entry_station).to eq station
end

it "on touch out the card will forget the station" do
  subject.top_up(10)
  subject.touch_in(station)
  expect{subject.touch_out}.to change{subject.entry_station}.to(nil)
end

end
