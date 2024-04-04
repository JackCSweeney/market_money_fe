class MarketsService

  def conn
    Faraday.new(url: "http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_markets
    get_url("/api/v0/markets")[:data]
  end

  def get_single_market(market_id)
    get_url("/api/v0/markets/#{market_id}")[:data]
  end

end