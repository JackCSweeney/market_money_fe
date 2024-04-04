require 'rails_helper'

RSpec.describe "Markets Index Page" do
  it 'can visit the markets index page, see all markets, and buttons to take you to the markets show page' do
    # As a visitor, when I visit '/markets'
    visit "/markets"
    # I see all markets listed with their name, city and state
    expect(page).to have_content("Markets")
    within ".markets" do
      within first("#market") do
        expect(page).to have_content("14&U Farmers' Market")# name
        expect(page).to have_content("Washington")# city
        expect(page).to have_content("District of Columbia")# state
        expect(page).to have_button("More Info")
      end
    end
    # When I click a button to see more info on that market
    within ".markets" do
      within first("#market") do
        click_on "More Info"
    # I'm taken to that market's show page '/markets/:id'
        expect(current_path).to eq("/markets/322458")
      end
    end
  end
end