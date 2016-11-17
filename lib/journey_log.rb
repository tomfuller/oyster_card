class JourneyLog

  attr_reader :journey, :current_journey_stations, :journey_history

  def initialize(journey_klass)
    @journey = journey_klass.new
    @current_journey_stations = []
    @journey_history = []
  end

  def start(entry_station)
    begin_journey
    self.current_journey_stations << ["Entry Station", entry_station]
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
    self.current_journey_stations << ["Exit Station", exit_station]
  end

  def end_journey
    self.journey.journey_end
  end

  def save_journey_to_history
    self.journey_history << self.current_journey_stations.to_h
  end

  private

  def journey_started?
    self.journey.start_journey
  end

  def journey_ended?
    self.journey.end_journey
  end


end
