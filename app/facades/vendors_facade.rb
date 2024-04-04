class VendorsFacade

  def initialize(vendor_id = nil)
    @vendor_id = vendor_id
  end

  def vendor
    vendor_data = VendorsService.new.get_vendor(@vendor_id)
    Vendor.new(vendor_data)
  end

end