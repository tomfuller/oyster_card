class Oyster
attr_reader :balance
DEFAULT_BALANCE = 0
MAX_CAPACITY = 90

 def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
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

private

def max_capacity?(money)
  @balance + money > MAX_CAPACITY
end

def overdrawn?(money)
  @balance - money < 0
end

end
