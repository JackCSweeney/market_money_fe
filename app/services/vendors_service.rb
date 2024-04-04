class VendorsService
  
  def conn
    Faraday.new(url: "http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_vendor(vendor_id)
    get_url("/api/v0/vendors/#{vendor_id}")[:data]
  end
end