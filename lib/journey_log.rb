#manages the journey
require './lib/journey.rb'

class JourneyLog

attr_reader :journey, :journey_history, :journey_tracker

  def initialize(journey_klass)
    @journey = journey_klass
    @journey_history = []
    @journey_tracker = []
  end

  def start(station)
    create_new_journey
    current_journey
    self.journey_tracker << ["entry", station]
  end

  def finish(station)

    self.journey_tracker << ["exit", station]
    current_journey
    #save_current_journey_to_history
  end

  private

  def create_new_journey
    self.journey.new
  end

  def save_current_journey_to_history
    self.journey_history << self.journey_tracker.to_h
    self.journey_tracker.clear
  end

  def current_journey
    create_new_journey if self.journey_tracker == []
    save_current_journey_to_history if self.journey_tracker[0] != nil

  end

end
