require_relative 'station'
require_relative 'journey_log'

class Oystercard

  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_accessor :balance
  attr_reader :journey_log


  def initialize(journey_log_klass)
    @journey_log = journey_log_klass.new
    @balance = DEFAULT_VALUE
  end

  def top_up(value)
    raise "Maximum balance limit of £#{MAXIMUM_BALANCE} exceeded" if (balance + value) > MAXIMUM_BALANCE
    self.balance += value
  end

  def touch_in(entry_station)
    raise "Not enough funds. Minimum is £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    create_new_journey(entry_station)
  end

  def touch_out(exit_station)
    finish_journey(exit_station)
    deduct(MINIMUM_BALANCE)
  end


  private

  def deduct(value)
    self.balance -= value
  end

  def create_new_journey(entry_station)
    self.journey_log.start(entry_station)
  end

  def finish_journey(exit_station)
    self.journey_log.finish(exit_station)
  end

end
