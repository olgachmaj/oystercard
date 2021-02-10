require './public_transport.rb'
require './journey.rb'
require "./station"

class Oystercard

  BALANCE_LIMIT = 90
  SINGLE_JOURNEYS_PRICE = 1
  def initialize()
    @balance = 0
    @entry_station = nil
    @trips = []
    @current_journey = Journey.new
  end

  def top_up(amount)
    raise "Amount would exceed balance limit #{BALANCE_LIMIT}. Enter lower amount" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    deduct(@current_journey.fare_in)
    raise 'Not enough money on the card' if @balance < SINGLE_JOURNEYS_PRICE

    start_new_journey(station)
  end

  def touch_out(station)
    deduct(@current_journey.fare_out)
    store_trips(station)
    finish_journey
  end

  def store_trips(station)
    @trips << {:entry_station => @entry_station, :exit_station => station.get_station}
  end


  def start_new_journey(station)
    @current_journey = @current_journey.new
    @current_journey.start
    @entry_station = station.get_station
  end

  def finish_journey
    @current_journey.finish
    @entry_station = nil
  end

  def entry_station
    @entry_station
  end

  def trips
    @trips
  end

end
