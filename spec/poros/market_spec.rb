require 'rails_helper'

RSpec.describe Market do
  describe '#initialize' do
    before(:each) do
      market_data = {
        id: 1,
        attributes: {
          name: "Marks Market",
          city: "Los Angeles",
          state: "California"
        }
      }
  
      @market = Market.new(market_data)
    end
    
    it 'exists' do
      expect(@market).to be_a(Market)
    end
  
    it 'has attributes' do
      expect(@market.name).to eq("Marks Market")
      expect(@market.city).to eq("Los Angeles")
      expect(@market.state).to eq("California")
    end
  end
end