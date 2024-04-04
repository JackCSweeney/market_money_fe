require 'rails_helper'

RSpec.describe Vendor do
  before(:each) do
    vendor_data = {
      id: 1,
      attributes: {
        name: "Jack's Stuff",
        description: "Bad stuff, nice guy",
        contact_name: "Jack",
        contact_phone: "1-800-dont-call",
        credit_accepted: false
      }
    }

    @vendor = Vendor.new(vendor_data)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@vendor).to be_a(Vendor)
    end

    it 'has attributes' do
      expect(@vendor.id).to eq(1)
      expect(@vendor.name).to eq("Jack's Stuff")
      expect(@vendor.description).to eq("Bad stuff, nice guy")
      expect(@vendor.contact_name).to eq("Jack")
      expect(@vendor.contact_phone).to eq("1-800-dont-call")
      expect(@vendor.credit_accepted).to eq(false)
    end
  end
end