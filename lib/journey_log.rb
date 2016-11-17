class JourneyLog

  attr_reader :journey

  def initialize(journey_klass)
    @journey = journey_klass.new
  end

  def start(entry_station)
    begin_journey
  end

  def begin_journey
    self.journey.journey_start
  end

  def current_journey
    begin_journey unless journey_started?
    end_journey unless journey_ended?
  end

  def finish(exit_station)
    end_journey
  end

  def end_journey
    self.journey.journey_end
  end

  private

  def journey_started?
    self.journey.start_journey
  end

  def journey_ended?
    self.journey.end_journey
  end


end
