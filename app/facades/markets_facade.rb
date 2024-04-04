class MarketsFacade

  def initialize(market_id = nil)
    @market_id = market_id
  end

  def markets
    MarketsService.new.get_all_markets.map do |market_data|
      Market.new(market_data)
    end
  end

  def market
    market_data = MarketsService.new.get_single_market(@market_id)
    Market.new(market_data)
  end

  def market_vendors
    MarketVendorsService.new.get_market_vendors(@market_id).map do |vendor_data|
      Vendor.new(vendor_data)
    end
  end

end