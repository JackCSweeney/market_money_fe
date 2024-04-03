class Market
  attr_reader :id,
              :name,
              :city,
              :state

  def initialize(market_data)
    @id = market_data[:id]
    @name = market_data[:attributes][:name]
    @city = market_data[:attributes][:city]
    @state = market_data[:attributes][:state]
  end
end