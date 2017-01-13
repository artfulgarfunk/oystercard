
class Journey
  attr_accessor :entry_station, :exit_station
  MIN_FARE = 1
  PENALTY = 6

  def initialize(entry_station = nil,exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @journey = Hash.new
  end

  def start(entry_station)
    @entry_station = entry_station
    @journey[:entry_station] = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    @journey[:exit_station] = exit_station
  end

  def fare
    if @entry_station == nil || @exit_station == nil
      PENALTY
    else
      MIN_FARE
    end 
  end

  def complete?
  end

end
