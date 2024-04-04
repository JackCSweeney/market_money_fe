require 'rails_helper'

RSpec.describe MarketsFacade do
  before (:each) do
    @facade = MarketsFacade.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facade).to be_a(MarketsFacade)
    end

    it 'has a market attribute' do
      expect(@facade.market).to eq(nil)
    end
  end

  describe '#markets' do
    it 'returns an array of market objects' do
      expect(@facade.markets).to be_a(Array)
      expect(@facade.markets.all?{|market| market.class == Market}).to eq(true)
    end
  end

  describe '#get_market(market_id)' do
    it 'returns a single market object' do
      expect(@facade.get_market(322458)).to be_a(Market)
    end
  end

  describe '#market_vendors' do
    it 'returns an array of vendor objects' do
      @facade.get_market(322458)
      expect(@facade.market_vendors).to be_a(Array)
      expect(@facade.market_vendors.first).to be_a(Vendor)
    end
  end
end