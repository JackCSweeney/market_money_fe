require 'rails_helper'

RSpec.describe MarketsFacade do
  before (:each) do
    @facade = MarketsFacade.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facade).to be_a(MarketsFacade)
    end
  end

  describe '#markets' do
    it 'returns an array of market objects' do
      expect(@facade.markets).to be_a(Array)
      expect(@facade.markets.all?{|market| market.class == Market}).to eq(true)
    end
  end
end