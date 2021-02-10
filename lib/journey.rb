require './oystercard.rb'
require './public_transport.rb'
require "./station"

class Journey
  def initialize(currently_in_journey = false)

    currently_in_journey = currently_in_journey
  end

  def fare_in
     return 6 if @currently_in_journey
     1
  end

  def fare_out
    return 1 if @currently_in_journey
    6
  end

  def finish
    @currently_in_journey = false
  end

  def start
    @currently_in_journey = true
  end

  def new
    Journey.new
  end

end
