require "oystercard"

describe Oystercard do


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
  subject.deduct(5)
  expect(subject.balance).to eq 15
end

it "should respond to 'in_journey'" do
  expect(subject).to respond_to(:in_journey?)
end

it "should respond to 'touch_in'" do
  expect(subject).to respond_to(:touch_in)
end

it "should be in a journey after touching in" do
subject.touch_in
expect(subject.in_journey).to be true
end

it "should respond to 'touch_out'" do
  expect(subject).to respond_to(:touch_out)
end

it "should be in a journey after touching out" do
subject.touch_out
expect(subject.in_journey).to be false
end

end
