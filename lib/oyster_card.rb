require './lib/journey.rb'
require './lib/station.rb'

class OysterCard
  attr_accessor :balance, :journey, :journey_history

  MAX_BALANCE = 90
  MIN_JOURNEY_FUND = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    msg = "Attempted to top up beyond max value of £#{MAX_BALANCE}.00"
    raise msg if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    msg = "Insufficient funds"
    raise msg if balance < MIN_JOURNEY_FUND
    @journey = Journey.new
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    deduct(MIN_JOURNEY_FUND)
    @journey_history << @journey
  end

  # def in_journey?
  #   !!@entry_station
  # end

  private
  attr_accessor :deduct

  def deduct(amount)
    msg = "You don't have enough balance"
    raise msg if balance - amount < 0
    @balance -= amount
  end

end
