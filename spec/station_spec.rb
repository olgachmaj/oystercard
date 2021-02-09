require './oystercard.rb'
require './public_transport.rb'
require './station.rb'

describe Station do

  describe '#name' do
    it'gets station name' do
      station = Station.new('Bexleyheath','green')
      expect(station.get_station).to eq 'Bexleyheath'
    end
  end
end
