class Oystercard

attr_accessor :balance, :entry_station, :journey_history, :journey_counter

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

def initialize
  @balance = 0
  @entry_station
  @journey_history = Hash.new
  @journey_counter = 1
end

def top_up(amount)
  fail "Top up too much. Maximum balance is £90. Current balance is #{self.balance}" if self.balance + amount > MAXIMUM_BALANCE
  self.balance += amount
end

def in_journey?
  !!self.entry_station
end

def touch_in(station)
  if self.balance < MINIMUM_BALANCE
    fail("You do not have sufficient funds. Please top up your card.")
  else
    self.entry_station = station
    record_entry(station)
  end
end

def touch_out(station)
  record_exit(station)
  self.entry_station = nil
  deduct
end

def record_entry(station)
  self.journey_history["journey_#{self.journey_counter}"] = { "entry" => station}
end

def record_exit(station)
  self.journey_history["journey_#{self.journey_counter}"].merge!({ "exit" => station})
  self.journey_counter += 1
end

private

def deduct
  self.balance -= MINIMUM_BALANCE
end




end
