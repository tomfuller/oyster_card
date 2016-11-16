class Oyster
attr_reader :journey, :history
attr_accessor :entry_station, :exit_station, :balance
DEFAULT_BALANCE = 0
MAX_CAPACITY = 90
MINIMUM_FARE = 1
 def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @entry_station = nil
   @exit_station = nil
   @history = []
   @journey = []
 end

def top_up(money)
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
  fail message if max_capacity?(money)
  self.balance += money
end

def touch_in(station)
  message = "You're poor, go and top up"
  fail message if self.balance < MINIMUM_FARE
  save_entry(station)
end

def touch_out(station)
  deduct()
  save_exit(station)
  save_journey
  save_history
  delete_entry
  delete_exit
end



private

def save_journey
  journey << self.entry_station
  journey << self.exit_station
end

def save_history
  history << self.journey.to_h
end

def save_entry(station)
  self.entry_station = ["entry station", station]
end

def save_exit(station)
  self.exit_station = ["exit station", station]
end

def delete_entry
  self.entry_station = nil
end

def delete_exit
  self.exit_station = nil
end

def deduct(money = MINIMUM_FARE)
  self.balance -= money
end

def max_capacity?(money)
  balance + money > MAX_CAPACITY
end

end
