require 'rails_helper'

RSpec.describe MarketsFacade do
  before (:each) do
    @facade = MarketsFacade.new(322458)
    @facade_2 = MarketsFacade.new
  end

  describe '#initialize' do
    it 'exists and has optional initialize argument' do
      expect(@facade).to be_a(MarketsFacade)
      expect(@facade_2).to be_a(MarketsFacade)
    end
  end

  describe '#markets' do
    it 'returns an array of market objects' do
      expect(@facade.markets).to be_a(Array)
      expect(@facade.markets.all?{|market| market.class == Market}).to eq(true)
    end
  end

  describe '#market' do
    it 'returns a single market object' do
      expect(@facade.market).to be_a(Market)
    end
  end

  describe '#market_vendors' do
    it 'returns an array of vendor objects' do
      expect(@facade.market_vendors).to be_a(Array)
      expect(@facade.market_vendors.first).to be_a(Vendor)
    end
  end
end