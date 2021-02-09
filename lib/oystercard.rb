require './public_transport.rb'

class Oystercard

  BALANCE_LIMIT = 90
  SINGLE_JOURNEYS_PRICE = 1
  def initialize
    @balance = 0
    @journey = false
    @entry_station = nil
    @trips = []
  end

  def top_up(amount)
    raise "Amount would exceed balance limit #{BALANCE_LIMIT}. Enter lower amount" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    @entry_station = station.get_station
    raise 'Not enough money on the card' if @balance < SINGLE_JOURNEYS_PRICE
    @journey = true
  end

  def touch_out(station)
    deduct(SINGLE_JOURNEYS_PRICE)
    @journey = false
    store_trips(station)
    @entry_station = nil
  end

  def store_trips(station)
    @trips << {:entry_station => @entry_station, :exit_station => station.get_station}
  end

  def in_journey?
    @journey
  end

  def entry_station
    @entry_station
  end

  def trips
    @trips
  end

end
