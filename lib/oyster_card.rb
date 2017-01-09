class OysterCard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Attempted to top up beyond max value" if @balance + amount > 90
    @balance += amount
  end

end
