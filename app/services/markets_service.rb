class MarketsService

  def conn
    Faraday.new(url: "http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_markets
    get_url("/api/v0/markets")[:data].map do |market_data|
      Market.new(market_data)
    end
  end

end