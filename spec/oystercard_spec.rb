require './oystercard.rb'
require './public_transport.rb'
require "./station"

describe Oystercard do

  balance_limit = Oystercard::BALANCE_LIMIT
  more_than_limit = 91
  test_amount = 5
  single_journeys_price = Oystercard::SINGLE_JOURNEYS_PRICE

  before(:all) do
    @oystercard = Oystercard.new
  end

  describe '#top_up' do
    it 'adds money to @balance' do
      expect(@oystercard.top_up(test_amount)).to eq test_amount
    end

    it 'raises an error if adding money will exceed limit' do
      expect{ @oystercard.top_up(more_than_limit) }.to raise_error "Amount would exceed balance limit #{balance_limit}. Enter lower amount"
    end
  end

  describe '#deduct' do
    before(:all) do
      @oystercard = Oystercard.new
    end

    it 'deducts money off the balance' do
      @oystercard.top_up(test_amount)
      expect(@oystercard.deduct(test_amount)).to eq 0
    end
  end

  describe '#touch_in' do
    before(:all) do
      @oystercard = Oystercard.new
    end

    it 'raises an error if there is less than single journey price on the card' do
      journey = double()
      station = double()
      allow(journey).to receive(:fare_in) {(0)}
      allow(station).to receive(:get_station) { "Bexleyheath" }
      expect{ @oystercard.touch_in(journey) }.to raise_error'Not enough money on the card'
    end



    it 'stores the entry station' do
     journey = double()
     station = double()
     allow(station).to receive(:get_station) { "Bexleyheath" }
     allow(journey).to receive(:fare_in) {1}
     @oystercard.top_up(test_amount)
     @oystercard.touch_in(station)
     expect(@oystercard.entry_station).to eq station.get_station
    end

  end

  describe '#touch_out' do
    before(:all) do
      @oystercard = Oystercard.new
    end



    it 'stores the trips' do
      journey = double()
      station = double()
      allow(station).to receive(:get_station) { "Bexleyheath" }
      allow(journey).to receive(:fare_out ) {1}
      @oystercard.top_up(test_amount)
      @oystercard.touch_in(station)
      @oystercard.touch_out(station)
      expect(@oystercard.trips).to eq [{ :entry_station=>"Bexleyheath", :exit_station=>"Bexleyheath" }]
   end
  end


end
