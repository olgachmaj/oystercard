require './oystercard.rb'
require './public_transport.rb'
require "./station"

describe Journey do
  before do
    @journey = Journey.new
  end
  it 'calculates normal fare_in when currently_in_journey is false' do
    expect(@journey.fare_in).to eq 1
  end

  it 'calculates penalty fare_in when currently_in_journey is true' do
    @journey.start
    expect(@journey.fare_in).to eq 6
  end

  it 'calculates normal fare_out when currently_in_journey is true' do
    @journey.start
    expect(@journey.fare_out).to eq 1
  end

  it 'calculates penalty fare_out when currently_in_journey is false' do
    expect(@journey.fare_out).to eq 6
  end

end
