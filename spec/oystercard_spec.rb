require './oystercard.rb'
require './public_transport.rb'

describe Oystercard do
  
  balance_limit = Oystercard::BALANCE_LIMIT
  more_than_limit = 91
  test_amount = 5

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

end
