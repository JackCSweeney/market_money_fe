class MarketVendorsService

  def conn
    Faraday.new(url: "http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_market_vendors(market)
    get_url("/api/v0/markets/#{market.id}/vendors")[:data].map do |vendor_data|
      Vendor.new(vendor_data)
    end    
  end

end