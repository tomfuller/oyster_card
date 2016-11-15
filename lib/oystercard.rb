class Oystercard

  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_accessor :balance, :status


  def initialize
    @balance = DEFAULT_VALUE
    @status = :not_in_journey
  end

  def top_up(value)
    raise "Maximum balance limit of £#{MAXIMUM_BALANCE} exceeded" if (balance + value) > MAXIMUM_BALANCE
    self.balance += value
  end

  def deduct(value)
    self.balance -= value
  end

  def touch_in
    raise "Not enough funds. Minimum is £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    self.status = :in_journey
  end

  def touch_out
    self.status = :not_in_journey
  end

  def in_journey?
    status == :in_journey
  end

end
