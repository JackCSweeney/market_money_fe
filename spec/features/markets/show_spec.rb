require 'rails_helper'

RSpec.describe 'Market Show Page' do
  describe 'As a visitor' do
    it 'can visit a markets show page and see its address, all vendors at the market and each vendor links to the vendors show page' do
      # As a visitor, When I visit a market's show page 'markets/:id'
      visit "/markets/322458"
      # I see that market's name and readable address
      expect(page).to have_content("14&U Farmers' Market")
      expect(page).to have_content("1400 U Street NW Washington, District of Columbia 20009")
      # And I also see a list of all the Vendors that are at that market
      # Each vendor name is a link to that vendor's show page
      expect(page).to have_css(".vendors")

      within ".vendors" do
        expect(page).to have_css("#vendor", count: 1)
        within first("#vendor") do
          expect(page).to have_link("The Charcuterie Corner", href: "/vendors/55823")
        end
      end
    end
  end
end