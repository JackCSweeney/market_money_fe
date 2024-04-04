class MarketsFacade

  def initialize(market_id = nil)
    @market_id = market_id
  end

  def markets
    MarketsService.new.get_all_markets
  end

  def market
    MarketsService.new.get_single_market(@market_id)
  end

  def market_vendors
    MarketVendorsService.new.get_market_vendors(@market_id).map do |vendor_data|
      Vendor.new(vendor_data)
    end
  end

end