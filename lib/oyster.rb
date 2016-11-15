class Oyster
attr_reader :balance, :in_journey, :entry_station
DEFAULT_BALANCE = 0
MAX_CAPACITY = 90
MINIMUM_FARE = 1
 def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
    @entry_station = nil
 end

def top_up(money)
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
  fail message if max_capacity?(money)
  @balance += money
end

def touch_in(station)
  message = "You're poor, go and top up"
  fail message if @balance < MINIMUM_FARE
  save(station)
end

def touch_out
  deduct
  delete_entry
end

def save(station)
  @entry_station = station
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
