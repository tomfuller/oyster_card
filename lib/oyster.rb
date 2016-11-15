class Oyster
attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys
DEFAULT_BALANCE = 0
MAX_CAPACITY = 90
MINIMUM_FARE = 1
 def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @entry_station = nil
   @exit_station = nil
   @journeys = {}
 end

def top_up(money)
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
  fail message if max_capacity?(money)
  @balance += money
end

def touch_in(station)
  message = "You're poor, go and top up"
  fail message if @balance < MINIMUM_FARE
  save_entry(station)
end

def touch_out(station)
  deduct
  delete_entry
  save_exit(station)
  save_journey
end

def save_journey
  @journey[entry_station] = exit_station
end

def save_entry(station)
  @entry_station = station
end

def save_exit(station)
  @exit_station = station
end

private

def delete_entry
  @entry_station = nil
end

def deduct(money = MINIMUM_FARE)
  @balance -= money
end

def max_capacity?(money)
  @balance + money > MAX_CAPACITY
end

end
