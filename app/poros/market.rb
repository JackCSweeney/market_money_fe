class Market
  attr_reader :name,
              :city,
              :state

  def initialize(market_data)
    @name = market_data[:attributes][:name]
    @city = market_data[:attributes][:city]
    @state = market_data[:attributes][:state]
  end
end