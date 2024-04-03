class MarketsFacade

  def markets
    MarketsService.new.get_all_markets
  end

end