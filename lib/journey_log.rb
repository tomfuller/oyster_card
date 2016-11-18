#manages the journey
require './lib/journey.rb'

class JourneyLog

attr_reader :journey, :journey_history, :current_journey

  def initialize(journey_klass)
    @journey = journey_klass
    @journey_history = []
    @current_journey = []
  end

  def start(station)
    self.current_journey << ["entry", station]
    create_new_journey
  end

  def finish(station)
    self.current_journey << ["exit", station]
    save_current_journey_to_history
  end

  private

  def create_new_journey
    self.journey.new
  end

  def save_current_journey_to_history
    self.journey_history << self.current_journey.to_h
    self.current_journey.clear
  end

end
