require 'rails_helper'

RSpec.describe 'Vendor Show Page' do
  describe 'As a visito' do
    it 'can visit a vendors show page and see their name, contact info, and vendor info' do
      # As a visitor When I visit a vendor's show page 'vendors/:id'
      visit '/vendors/55823'
      # I see that vendor's name, contact information, whether they accept credit, and a description of what they sell
      expect(page).to have_content("The Charcuterie Corner")

      within ".contact_info" do
        expect(page).to have_content("Name: Claudie Langworth III")
        expect(page).to have_content("Phone: 1-147-179-9747")
      end

      within ".vendor_info" do
        expect(page).to have_content("Credit Accepted?: NO")
        expect(page).to have_content("Description: Vendor selling a variety of artisanal cured meats and sausages.")
      end
    end
  end
end
