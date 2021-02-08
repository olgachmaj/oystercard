require './public_transport.rb'

class Oystercard

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0

  end

  def top_up(amount)
    raise "Amount would exceed balance limit #{BALANCE_LIMIT}. Enter lower amount" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
