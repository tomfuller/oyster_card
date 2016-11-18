class Oystercard

attr_accessor :balance, :entry_station, :journey_history, :current_journey

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @current_journey = []
  end

  def top_up(amount)
    fail "Top up too much. Maximum balance is £90. Current balance is #{self.balance}" if self.balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def touch_in(station)
    if self.balance < MINIMUM_BALANCE
      fail("You do not have sufficient funds. Please top up your card.")
    else
      @entry_station = station
      record_entry(station)
    end
  end

  def touch_out(station)
    record_exit(station)
    self.entry_station = nil
    deduct
    save_current_journey_to_history
  end

  def record_entry(station)
    self.current_journey << ["entry", station]
  end

  def record_exit(station)
    self.current_journey << ["exit", station]
  end

  private

    def deduct
      self.balance -= MINIMUM_BALANCE
    end

    def save_current_journey_to_history
      self.journey_history << self.current_journey.to_h
      self.current_journey.clear
    end

end
