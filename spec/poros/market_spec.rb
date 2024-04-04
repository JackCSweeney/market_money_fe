require 'rails_helper'

RSpec.describe Market do
  before(:each) do
    market_data = {
      id: 1,
      attributes: {
        name: "Marks Market",
        city: "Los Angeles",
        state: "California",
        street: "14 left st.",
        zip: "90034"
      }
    }

    @market = Market.new(market_data)
  end

  describe '#initialize' do    
    it 'exists' do
      expect(@market).to be_a(Market)
    end
  
    it 'has attributes' do
      expect(@market.name).to eq("Marks Market")
      expect(@market.city).to eq("Los Angeles")
      expect(@market.state).to eq("California")
    end
  end

  describe '#instance methods' do
    it 'can return a street address' do
      expect(@market.address).to eq("14 left st.\nLos Angeles, California 90034")
    end
  end
end