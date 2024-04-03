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
        expect(@service.get_url("/api/v0/markets")).to be_a(Hash)

      end
    end

    describe '#get_all_markets' do
      it 'can return Market poros' do
        expect(@service.get_all_markets).to be_a(Array)
        expect(@service.get_all_markets.all?{|market| market.class == Market}).to eq(true)
      end
    end
  end
end

