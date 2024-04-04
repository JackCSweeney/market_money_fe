require 'rails_helper'

RSpec.describe MarketVendorsService do
  before(:each) do
    market_data = {
      id: 322458,
      attributes: {
        name: "Marks Market",
        city: "Los Angeles",
        state: "California"
      }
    }
    @market = Market.new(market_data)
    @service = MarketVendorsService.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@service).to be_a(MarketVendorsService)
    end
  end

  describe '#instance methods' do
    describe '#get_market_vendors(market)' do
      it 'can return all vendors for the given market' do
        expect(@service.get_market_vendors(@market)).to be_a(Array)
        expect(@service.get_market_vendors(@market).first).to be_a(Vendor)
      end
    end

    describe '#conn' do
      it 'creates a faraday connection' do
        expect(@service.conn).to be_a(Faraday::Connection)
      end
    end

    describe '#get_url(url)' do
      it 'returns JSON data for vendors' do
        response = @service.get_url("/api/v0/markets/322458/vendors")

        expect(response).to be_a(Hash)
        expect(response[:data]).to be_a(Array)

        data = response[:data]

        expect(data.first).to be_a(Hash)
        expect(data.first).to have_key(:attributes)
        expect(data.first).to have_key(:id)

        attributes = data.first[:attributes]

        expect(attributes).to be_a(Hash)
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a(String)

        expect(attributes).to have_key(:description)
        expect(attributes[:description]).to be_a(String)

        expect(attributes).to have_key(:contact_name)
        expect(attributes[:contact_name]).to be_a(String)
        
        expect(attributes).to have_key(:contact_phone)
        expect(attributes[:contact_phone]).to be_a(String)

        expect(attributes).to have_key(:credit_accepted)
        boolean = [true, false]
        expect(boolean.include?(attributes[:credit_accepted])).to eq(true)
      end
    end
  end
end   