require 'rails_helper'

RSpec.describe VendorsService do
  before(:each) do
    @service = VendorsService.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@service).to be_a(VendorsService)
    end
  end

  describe '#instance methods' do
    describe '#get_vendor(vendor_id)' do
      it 'can return the data for a specific vendor' do
        expect(@service.get_vendor(55823)).to be_a(Hash)
        
        data = @service.get_vendor(55823)

        expect(data).to have_key(:id)
        expect(data[:id]).to be_a(Integer)

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]

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
        expect(boolean.include?(attributes[:credit_accepted])).to be_a(true)
      end
    end

    describe '#conn' do
      it 'creates a faraday connection' do
        expect(@service.conn).to be_a(Faraday::Connection)
      end
    end

    describe '#get_url' do
      it 'can return a JSON response from the url that is input' do
        response = @service.get_url("/api/v0/markets")

        expect(response).to be_a(Hash)
      end
    end
  end
end