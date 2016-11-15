require_relative 'station'

class Oystercard

  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_accessor :balance, :stored_station, :stored_exit_station
  attr_reader :journey_history, :journey


  def initialize
    @balance = DEFAULT_VALUE
    @journey = []
    @journey_history = []
  end

  def top_up(value)
    raise "Maximum balance limit of £#{MAXIMUM_BALANCE} exceeded" if (balance + value) > MAXIMUM_BALANCE
    self.balance += value
  end

  def touch_in(entry_station)
    raise "Not enough funds. Minimum is £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    self.journey << ['Entry station', entry_station]
  end

  def touch_out(exit_station)
    deduct(1)
    self.journey << ['Exit station', exit_station]
    save_journey_to_history
  end

  def in_journey?
    journey.count % 2 != 0
  end

  def save_journey_to_history
    journey_history << journey.to_h
    journey.clear
  end

  private

  def deduct(value)
    self.balance -= value
  end

end
