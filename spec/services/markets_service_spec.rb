require 'rails_helper'

RSpec.describe MarketsService do
  before(:each) do
    @service = MarketsService.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@service).to be_a(MarketsService)
    end
  end

  describe '#instance methods' do
    describe '#conn' do
      it 'creates a faraday connection' do
        expect(@service.conn).to be_a(Faraday::Connection)
      end
    end

    describe '#get_url' do
      it 'can return a JSON response from the url that is input' do
        response = @service.get_url("/api/v0/markets")

        expect(response).to be_a(Hash)
        expect(response[:data]).to be_a(Array)

        data = response[:data].first

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]
        
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a(String)

        expect(attributes).to have_key(:city)
        expect(attributes[:city]).to be_a(String)

        expect(attributes).to have_key(:state)
        expect(attributes[:state]).to be_a(String)
      end
    end

    describe '#get_all_markets' do
      it 'can return Market data' do
        expect(@service.get_all_markets).to be_a(Array)
        expect(@service.get_all_markets.first).to be_a(Hash)
      end
    end

    describe '#get_single_market(market_id)' do
      it 'can return a single markets data' do
        expect(@service.get_single_market(322458)).to be_a(Hash)
      end
    end
  end
end

