require './lib/journey.rb'
require './lib/station.rb'

class OysterCard
  attr_accessor :balance, :journey, :journey_history

  MAX_BALANCE = 90
  MIN_JOURNEY_FUND = 1

  def initialize
    @balance = 0
    @touched_in = false
    # @journey_history = []
  end

  def top_up(amount)
    raise "Attempted to top up beyond max value of £#{MAX_BALANCE}.00" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if balance < MIN_JOURNEY_FUND
    deduct if @touched_in == true
    (@journey = Journey.new).start(entry_station)
    @touched_in = true
  end

  def touch_out(exit_station)
    @journey = Journey.new if @touched_in == false
    @journey.finish(exit_station)
    deduct
    # @journey_history << @journey
  end

  # def in_journey?
  #   !!@entry_station
  # end

  # private

  def deduct
    @balance -= @journey.fare
  end

end
