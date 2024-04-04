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
    @street = market_data[:attributes][:street]
    @zip = market_data[:attributes][:zip]
  end

  def address
    "#{@street}\n#{@city}, #{@state} #{@zip}"
  end
end