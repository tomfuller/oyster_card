class Journey

  attr_accessor :start_journey, :end_journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @start_journey = false
    @end_journey = false
  end

  def journey_start
    self.start_journey = true
  end

  def journey_end
    self.end_journey = true
  end

  def journey_complete?
    self.start_journey == self.end_journey
  end

  def calculate_fare
    return PENALTY_FARE unless journey_complete?
    MINIMUM_FARE
  end

end
