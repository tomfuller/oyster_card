class JourneyLog

  attr_reader :current_journey_stations, :journey_history
  attr_accessor :journey
  def initialize
    @current_journey_stations = []
    @journey_history = []
    @journey = false
  end

  def start(entry_station)
    create_new_journey(Journey)
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
    current_journey if self.journey == false
    end_journey
    self.current_journey_stations << ["Exit Station", exit_station]
  end

  def end_journey
    self.journey.journey_end
  end

  def save_journey_to_history
    self.journey_history << self.current_journey_stations.to_h
  end

  def create_new_journey(journey_klass)
    self.journey = journey_klass.new
  end

  def journey_started?
    create_new_journey(Journey) if self.journey == false
    self.journey.start_journey
  end

  def journey_ended?
    self.journey.end_journey
  end


end
