class MarketVendorsService

  def conn
    Faraday.new(url: "http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_market_vendors(market_id)
    get_url("/api/v0/markets/#{market_id}/vendors")[:data]
  end

end