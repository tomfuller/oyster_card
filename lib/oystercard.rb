class Oystercard

attr_reader :balance, :in_journey, :station

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

def initialize
  @balance = 0
  @in_journey = false
  @station
end

def top_up(amount)
  fail "Top up too much. Maximum balance is £90. Current
  balance is #{self.balance}" if @balance + amount > MAXIMUM_BALANCE
  @balance += amount
end

def in_journey?
  @in_journey
end

def touch_in
  if @balance < MINIMUM_BALANCE
    fail("You do not have sufficient funds. Please top up your card.")
  else
    @in_journey = true
end
end

def touch_out
  @journey = false
  deduct
end

private

def deduct
  @balance -= MINIMUM_BALANCE
end

end
