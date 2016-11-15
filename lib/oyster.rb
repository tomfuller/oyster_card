class Oyster
attr_reader :balance, :in_journey
DEFAULT_BALANCE = 0
MAX_CAPACITY = 90
MINIMUM_FARE = 1
 def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @in_journey = false
 end

def top_up(money)
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
  fail message if max_capacity?(money)
  @balance += money
end


def deduct(money)
  message = "You're poor, go and top up"
  fail message if overdrawn?(money)
  @balance -= money
end

def touch_in
  message = "You're poor, go and top up"
  fail message if @balance < MINIMUM_FARE
  @in_journey = true
end

def touch_out
  @in_journey = false
end

private

def max_capacity?(money)
  @balance + money > MAX_CAPACITY
end

def overdrawn?(money)
  @balance - money < 0
end

end
