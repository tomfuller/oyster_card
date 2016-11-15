class Oystercard

  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  attr_accessor :balance


  def initialize
    @balance = DEFAULT_VALUE
  end

  def top_up(value)
    raise "Maximum balance limit of £#{MAXIMUM_BALANCE} exceeded" if (balance + value) > MAXIMUM_BALANCE
    self.balance += value
  end

  def deduct(value)
    self.balance -= value
  end
end
