class Journey

attr_accessor :start, :end

MIN_FARE = 1
PENALTY_FARE = 6

  def initialize
    @start = false
    @end = false
  end

  def begin
    self.start = true
  end

  def finish
    self.end = true
  end

  def complete?
    self.start == self.end
  end

  def fare
    return MIN_FARE if complete?
    PENALTY_FARE
  end

end
