class MarketsFacade

  attr_reader :market

  def initialize
    @market_id = nil
    @markets = nil
    @market = nil
    @vendors = nil
  end

  def markets
    @markets = MarketsService.new.get_all_markets
  end

  def get_market(market_id)
    @market_id = market_id
    @market = MarketsService.new.get_single_market(market_id)
  end

  def market_vendors
    @vendors = MarketVendorsService.new.get_market_vendors(@market_id)
  end

end