require './oystercard.rb'
require './public_transport.rb'

class Station

  def initialize(name,zone)
    @name = name
    @zone = zone
  end
  def get_station
    @name
  end
  def get_zone
    @zone
  end
end
