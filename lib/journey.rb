class Journey

  attr_accessor :start_journey, :end_journey

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


end
