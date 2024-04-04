require 'rails_helper'

RSpec.describe VendorsFacade do
  before(:each) do
    @facade_1 = VendorsFacade.new(55823)
    @facade_2 = VendorsFacade.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facade_1).to be_a(VendorsFacade)
      expect(@facade_2).to be_a(VendorsFacade)
    end
  end

  describe '#instance methods' do
    describe '#vendor' do
      it 'can return a specific vendor if initialized with a vendor id' do
        expect(@facade_1.vendor).to be_a(Vendor)
      end
    end
  end
end